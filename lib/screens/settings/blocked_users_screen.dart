import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/empty_state.dart';
import '../../widgets/simple_app_bar.dart';

class BlockedUsersScreen extends StatefulWidget {
  const BlockedUsersScreen({super.key});

  @override
  State<BlockedUsersScreen> createState() => _BlockedUsersScreenState();
}

class _BlockedUsersScreenState extends State<BlockedUsersScreen> {
  List<Map<String, dynamic>> _blockedUsers = [
    {'name': 'أحمد علي', 'avatar': null, 'date': '2024-01-15'},
    {'name': 'فاطمة محمد', 'avatar': null, 'date': '2024-01-10'},
  ];

  void _unblockUser(int index) {
    setState(() {
      _blockedUsers.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم إلغاء الحظر بنجاح')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'المستخدمون المحظورون'),
      body: _blockedUsers.isEmpty
          ? const EmptyState(
              icon: Icons.block_outlined,
              title: 'لا يوجد مستخدمون محظورون',
              subtitle: 'عندما تقوم بحظر مستخدم، سيظهر هنا',
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _blockedUsers.length,
              itemBuilder: (context, index) {
                final user = _blockedUsers[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppTheme.goldColor.withOpacity(0.2),
                      child: Text(
                        user['name'][0],
                        style: const TextStyle(color: AppTheme.goldColor),
                      ),
                    ),
                    title: Text(user['name']),
                    subtitle: Text('تم الحظر في ${user['date']}'),
                    trailing: TextButton(
                      onPressed: () => _unblockUser(index),
                      child: const Text(
                        'إلغاء الحظر',
                        style: TextStyle(color: AppTheme.success),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
