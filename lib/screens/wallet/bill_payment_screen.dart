import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class BillPaymentScreen extends StatefulWidget {
  const BillPaymentScreen({super.key});

  @override
  State<BillPaymentScreen> createState() => _BillPaymentScreenState();
}

class _BillPaymentScreenState extends State<BillPaymentScreen> {
  final List<Map<String, dynamic>> bills = [
    {'name': 'فاتورة الكهرباء', 'amount': '25,000', 'icon': Icons.electric_bolt, 'color': Colors.yellow},
    {'name': 'فاتورة الماء', 'amount': '8,500', 'icon': Icons.water_drop, 'color': Colors.blue},
    {'name': 'فاتورة الإنترنت', 'amount': '15,000', 'icon': Icons.wifi, 'color': Colors.green},
    {'name': 'فاتورة الهاتف', 'amount': '5,000', 'icon': Icons.phone, 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'دفع الفواتير'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bills.length,
        itemBuilder: (context, index) {
          final bill = bills[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: (bill['color'] as Color).withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                child: Icon(bill['icon'] as IconData, color: bill['color']),
              ),
              title: Text(bill['name']),
              subtitle: Text('${bill['amount']} ر.ي', style: const TextStyle(color: AppTheme.goldColor, fontWeight: FontWeight.bold)),
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: AppTheme.goldColor, foregroundColor: Colors.black),
                child: const Text('دفع'),
              ),
            ),
          );
        },
      ),
    );
  }
}
