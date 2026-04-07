import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class DataUsageScreen extends StatefulWidget {
  const DataUsageScreen({super.key});

  @override
  State<DataUsageScreen> createState() => _DataUsageScreenState();
}

class _DataUsageScreenState extends State<DataUsageScreen> {
  bool _saveData = false;
  bool _compressImages = true;
  bool _autoPlayVideos = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'استهلاك البيانات'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildUsageCard('التخزين المحلي', '450 MB', Icons.storage, Colors.blue),
          _buildUsageCard('ذاكرة التخزين المؤقت', '120 MB', Icons.cached, Colors.orange),
          _buildUsageCard('التنزيلات', '890 MB', Icons.download, Colors.green),
          const SizedBox(height: 24),
          const Text('إعدادات البيانات', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('توفير البيانات'),
            subtitle: const Text('تعطيل تحميل الصور تلقائياً'),
            value: _saveData,
            onChanged: (v) => setState(() => _saveData = v),
            secondary: const Icon(Icons.data_saver_off),
          ),
          SwitchListTile(
            title: const Text('ضغط الصور'),
            subtitle: const Text('تقليل جودة الصور لتوفير البيانات'),
            value: _compressImages,
            onChanged: (v) => setState(() => _compressImages = v),
            secondary: const Icon(Icons.compress),
          ),
          SwitchListTile(
            title: const Text('تشغيل الفيديو تلقائياً'),
            subtitle: const Text('تشغيل مقاطع الفيديو عند التمرير'),
            value: _autoPlayVideos,
            onChanged: (v) => setState(() => _autoPlayVideos = v),
            secondary: const Icon(Icons.videocam),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.delete_forever),
            label: const Text('مسح ذاكرة التخزين المؤقت'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.error,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageCard(String title, String size, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(title),
        trailing: Text(size, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
