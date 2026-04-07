import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class BackupRestoreScreen extends StatefulWidget {
  const BackupRestoreScreen({super.key});

  @override
  State<BackupRestoreScreen> createState() => _BackupRestoreScreenState();
}

class _BackupRestoreScreenState extends State<BackupRestoreScreen> {
  bool _autoBackup = true;
  String _lastBackup = '2024-01-20 10:30';
  bool _isBackingUp = false;

  Future<void> _createBackup() async {
    setState(() => _isBackingUp = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isBackingUp = false;
      _lastBackup = DateTime.now().toString().substring(0, 16);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم إنشاء النسخة الاحتياطية بنجاح')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'نسخ احتياطي'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildOptionCard(
              icon: Icons.backup,
              title: 'إنشاء نسخة احتياطية',
              subtitle: 'حفظ البيانات في السحابة',
              color: Colors.blue,
              onTap: _createBackup,
              isLoading: _isBackingUp,
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              icon: Icons.restore,
              title: 'استعادة النسخة',
              subtitle: 'استرجاع البيانات المحفوظة',
              color: Colors.green,
              onTap: () {},
              isLoading: false,
            ),
            const SizedBox(height: 24),
            SwitchListTile(
              title: const Text('النسخ الاحتياطي التلقائي'),
              subtitle: const Text('إنشاء نسخة احتياطية يومياً'),
              value: _autoBackup,
              onChanged: (v) => setState(() => _autoBackup = v),
              secondary: const Icon(Icons.schedule),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.history),
                title: const Text('آخر نسخة احتياطية'),
                subtitle: Text(_lastBackup),
                trailing: const Icon(Icons.info_outline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
    required bool isLoading,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
