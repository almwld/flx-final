import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class DeveloperOptionsScreen extends StatelessWidget {
  const DeveloperOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'خيارات المطور'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('وضع التصحيح'),
            subtitle: const Text('عرض رسائل التصحيح'),
            value: false,
            onChanged: (v) {},
          ),
          SwitchListTile(
            title: const Text('تسجيل الشبكة'),
            subtitle: const Text('حفظ طلبات API'),
            value: false,
            onChanged: (v) {},
          ),
          ListTile(
            title: const Text('مسح قاعدة البيانات'),
            trailing: const Icon(Icons.delete, color: AppTheme.error),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
