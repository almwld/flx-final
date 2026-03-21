import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class CommissionScreen extends StatelessWidget {
  const CommissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'العمولات'),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: AppTheme.goldGradient,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                Text('الرصيد المعلق', style: TextStyle(color: Colors.black54)),
                Text('12,500 ر.ي', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildCommissionItem('عمولة طلب #1001', '450 ر.ي', '2024-01-20'),
                _buildCommissionItem('عمولة طلب #1002', '1,200 ر.ي', '2024-01-19'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommissionItem(String title, String amount, String date) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text(date),
        trailing: Text(amount, style: const TextStyle(color: AppTheme.goldColor)),
      ),
    );
  }
}
