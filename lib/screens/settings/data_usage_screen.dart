import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class DataUsageScreen extends StatelessWidget {
  const DataUsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'استهلاك البيانات'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildUsageCard('التخزين المحلي', '450 MB', Icons.storage),
          _buildUsageCard('الكاش', '120 MB', Icons.cached),
          _buildUsageCard('التنزيلات', '890 MB', Icons.download),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.delete_forever),
            label: const Text('مسح الكاش'),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageCard(String title, String size, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.goldColor),
        title: Text(title),
        trailing: Text(size, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
