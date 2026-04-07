import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  String _fromCurrency = 'YER';
  String _toCurrency = 'SAR';
  final _amountController = TextEditingController();
  double _convertedAmount = 0;
  final Map<String, double> _rates = {
    'YER': 1,
    'SAR': 0.015,
    'USD': 0.004,
    'AED': 0.0147,
    'EGP': 0.19,
  };

  void _convert() {
    final amount = double.tryParse(_amountController.text) ?? 0;
    final fromRate = _rates[_fromCurrency] ?? 1;
    final toRate = _rates[_toCurrency] ?? 1;
    final inBase = amount / fromRate;
    setState(() {
      _convertedAmount = inBase * toRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'محول العملات'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text('المبلغ', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24),
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: _buildCurrencySelector('من', _fromCurrency, (v) => setState(() => _fromCurrency = v))),
                        const Icon(Icons.swap_horiz, size: 32),
                        Expanded(child: _buildCurrencySelector('إلى', _toCurrency, (v) => setState(() => _toCurrency = v))),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _convert,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.goldColor,
                        foregroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('تحويل'),
                    ),
                  ],
                ),
              ),
            ),
            if (_convertedAmount > 0)
              Card(
                margin: const EdgeInsets.only(top: 16),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Text('النتيجة', style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 8),
                      Text(
                        '${_convertedAmount.toStringAsFixed(2)} $_toCurrency',
                        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppTheme.goldColor),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencySelector(String label, String selected, Function(String) onChanged) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        DropdownButton<String>(
          value: selected,
          items: _rates.keys.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
          onChanged: (v) => onChanged(v!),
        ),
      ],
    );
  }
}
