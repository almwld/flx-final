import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class OrderManagementScreen extends StatelessWidget {
  const OrderManagementScreen({super.key});

  final List<Map<String, dynamic>> orders = const [
    {'id': '#1001', 'status': 'جديد', 'amount': '45,000'},
    {'id': '#1002', 'status': 'قيد التجهيز', 'amount': '120,000'},
    {'id': '#1003', 'status': 'تم الشحن', 'amount': '85,000'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'إدارة الطلبات'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text('طلب ${order['id']}'),
              subtitle: Text(order['status']),
              trailing: Text('${order['amount']} ر.ي', style: const TextStyle(color: AppTheme.goldColor, fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}
