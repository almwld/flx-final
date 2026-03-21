import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  double amount = 1000;
  String fromCurrency = 'YER';
  String toCurrency = 'USD';

  final Map<String, double> rates = {
    'YER': 1,
    'USD': 0.004,
    'SAR': 0.015,
  };

  double get convertedAmount => amount * (rates[toCurrency]! / rates[fromCurrency]!);

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
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'المبلغ',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => amount = double.tryParse(value) ?? 0),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: fromCurrency,
                    decoration: const InputDecoration(labelText: 'من'),
                    items: ['YER', 'USD', 'SAR'].map((c) => 
                      DropdownMenuItem(value: c, child: Text(c))).toList(),
                    onChanged: (v) => setState(() => fromCurrency = v!),
                  ),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.arrow_forward),
                const SizedBox(width: 20),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: toCurrency,
                    decoration: const InputDecoration(labelText: 'إلى'),
                    items: ['YER', 'USD', 'SAR'].map((c) => 
                      DropdownMenuItem(value: c, child: Text(c))).toList(),
                    onChanged: (v) => setState(() => toCurrency = v!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.goldColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                '${convertedAmount.toStringAsFixed(2)} $toCurrency',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.goldColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
