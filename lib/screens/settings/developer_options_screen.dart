import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class DeveloperOptionsScreen extends StatefulWidget {
  const DeveloperOptionsScreen({super.key});

  @override
  State<DeveloperOptionsScreen> createState() => _DeveloperOptionsScreenState();
}

class _DeveloperOptionsScreenState extends State<DeveloperOptionsScreen> {
  bool _debugMode = false;
  bool _networkLogging = false;
  bool _showPerformance = false;
  bool _mockApi = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'خيارات المطور'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWarningCard(),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('وضع التصحيح'),
            subtitle: const Text('عرض رسائل التصحيح في وحدة التحكم'),
            value: _debugMode,
            onChanged: (v) => setState(() => _debugMode = v),
            secondary: const Icon(Icons.bug_report),
          ),
          SwitchListTile(
            title: const Text('تسجيل الشبكة'),
            subtitle: const Text('حفظ جميع طلبات API'),
            value: _networkLogging,
            onChanged: (v) => setState(() => _networkLogging = v),
            secondary: const Icon(Icons.network_check),
          ),
          SwitchListTile(
            title: const Text('عرض أداء التطبيق'),
            subtitle: const Text('عرض FPS واستخدام الذاكرة'),
            value: _showPerformance,
            onChanged: (v) => setState(() => _showPerformance = v),
            secondary: const Icon(Icons.speed),
          ),
          SwitchListTile(
            title: const Text('محاكاة API'),
            subtitle: const Text('استخدام بيانات وهمية بدلاً من API'),
            value: _mockApi,
            onChanged: (v) => setState(() => _mockApi = v),
            secondary: const Icon(Icons.sim_card),
          ),
          const Divider(height: 32),
          ListTile(
            leading: const Icon(Icons.delete_sweep, color: AppTheme.error),
            title: const Text('مسح قاعدة البيانات'),
            subtitle: const Text('حذف جميع البيانات المحلية'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _showConfirmDialog(context),
          ),
          ListTile(
            leading: const Icon(Icons.refresh, color: AppTheme.warning),
            title: const Text('إعادة ضبط الإعدادات'),
            subtitle: const Text('استعادة الإعدادات الافتراضية'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _resetSettings(),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('معلومات التطبيق', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _buildInfoRow('الإصدار', '1.0.0'),
                _buildInfoRow('Flutter', '3.22.0'),
                _buildInfoRow('Dart', '3.4.0'),
                _buildInfoRow('API', 'v1'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.warning.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.warning),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber, color: AppTheme.warning),
          const SizedBox(width: 12),
          Expanded(
            child: const Text(
              'هذه الإعدادات مخصصة للمطورين فقط. تغييرها قد يؤثر على أداء التطبيق.',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  void _showConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: const Text('هل أنت متأكد من رغبتك في مسح جميع البيانات المحلية؟ لا يمكن التراجع عن هذا الإجراء.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم مسح قاعدة البيانات')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
            child: const Text('مسح'),
          ),
        ],
      ),
    );
  }

  void _resetSettings() {
    setState(() {
      _debugMode = false;
      _networkLogging = false;
      _showPerformance = false;
      _mockApi = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم إعادة ضبط الإعدادات')),
    );
  }
}
