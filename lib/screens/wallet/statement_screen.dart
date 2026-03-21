import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class StatementScreen extends StatelessWidget {
  const StatementScreen({super.key});

  final List<Map<String, dynamic>> transactions = const [
    {'date': '2024-01-20', 'desc': 'إيداع', 'amount': '+50,000', 'type': 'in'},
    {'date': '2024-01-19', 'desc': 'شراء - متجر التقنية', 'amount': '-15,000', 'type': 'out'},
    {'date': '2024-01-18', 'desc': 'تحويل وارد', 'amount': '+25,000', 'type': 'in'},
    {'date': '2024-01-17', 'desc': 'فاتورة كهرباء', 'amount': '-5,000', 'type': 'out'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'كشف الحساب'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final t = transactions[index];
          final isIn = t['type'] == 'in';
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isIn ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                child: Icon(isIn ? Icons.arrow_downward : Icons.arrow_upward, color: isIn ? Colors.green : Colors.red),
              ),
              title: Text(t['desc']),
              subtitle: Text(t['date']),
              trailing: Text(
                t['amount'],
                style: TextStyle(color: isIn ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
