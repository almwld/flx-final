import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class BackupRestoreScreen extends StatelessWidget {
  const BackupRestoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'نسخ احتياطي'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildOption(Icons.backup, 'إنشاء نسخة احتياطية', 'حفظ البيانات في السحابة'),
            const SizedBox(height: 16),
            _buildOption(Icons.restore, 'استعادة النسخة', 'استرجاع البيانات المحفوظة'),
            const SizedBox(height: 32),
            CustomButton(text: 'نسخ الآن', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String title, String subtitle) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: AppTheme.goldColor, size: 32),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
