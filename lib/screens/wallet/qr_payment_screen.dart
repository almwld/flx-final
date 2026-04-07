import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class QrPaymentScreen extends StatefulWidget {
  const QrPaymentScreen({super.key});

  @override
  State<QrPaymentScreen> createState() => _QrPaymentScreenState();
}

class _QrPaymentScreenState extends State<QrPaymentScreen> {
  String _selectedTab = 'scan';
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'الدفع عبر QR'),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: _selectedTab == 'scan' ? _buildScanSection() : _buildGenerateSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.getCardColor(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildTab('مسح', 'scan'),
          _buildTab('إنشاء', 'generate'),
        ],
      ),
    );
  }

  Widget _buildTab(String title, String value) {
    final isSelected = _selectedTab == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = value),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.goldColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.black : AppTheme.getTextColor(context),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScanSection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
            ),
            child: const Center(
              child: Icon(Icons.qr_code_scanner, size: 100, color: Colors.black),
            ),
          ),
          const SizedBox(height: 24),
          const Text('امسح رمز QR للدفع'),
          const SizedBox(height: 8),
          const Text('ضع الكود أمام الكاميرا للمسح', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 32),
          CustomButton(
            text: 'فتح الكاميرا',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildGenerateSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'المبلغ',
              prefixIcon: Icon(Icons.attach_money),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: QrImageView(
              data: 'FLEX_PAY:${_amountController.text.isNotEmpty ? _amountController.text : '0'}',
              size: 200,
            ),
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: 'إنشاء رمز الدفع',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
