import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class BlockedUsersScreen extends StatelessWidget {
  const BlockedUsersScreen({super.key});

  final List<Map<String, dynamic>> blockedUsers = const [
    {'name': 'محمد علي', 'date': '2024-01-15'},
    {'name': 'أحمد حسن', 'date': '2024-01-10'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'المستخدمون المحظورون'),
      body: blockedUsers.isEmpty
          ? const Center(child: Text('لا يوجد مستخدمون محظورون'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: blockedUsers.length,
              itemBuilder: (context, index) {
                final user = blockedUsers[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(user['name']),
                    subtitle: Text('محظور منذ: ${user['date']}'),
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text('إلغاء الحظر', style: TextStyle(color: AppTheme.error)),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
