import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class ElectronicsScreen extends StatelessWidget {
  const ElectronicsScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'هواتف ذكية', 'icon': Icons.smartphone, 'color': Colors.blue, 'count': '2,456'},
    {'name': 'لابتوب', 'icon': Icons.laptop, 'color': Colors.grey, 'count': '1,234'},
    {'name': 'سماعات', 'icon': Icons.headphones, 'color': Colors.purple, 'count': '890'},
    {'name': 'كاميرات', 'icon': Icons.camera_alt, 'color': Colors.red, 'count': '567'},
    {'name': 'ألعاب', 'icon': Icons.sports_esports, 'color': Colors.green, 'count': '1,123'},
    {'name': 'اكسسوارات', 'icon': Icons.cable, 'color': Colors.orange, 'count': '3,456'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'الإلكترونيات'),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              '/products',
              arguments: {'category': 'إلكترونيات', 'subCategory': cat['name']},
            ),
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: (cat['color'] as Color).withOpacity(0.3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: (cat['color'] as Color).withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(cat['icon'] as IconData, color: cat['color'], size: 30),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    cat['name'],
                    style: const TextStyle(
                      fontFamily: 'Changa',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${cat['count']} منتج',
                    style: TextStyle(
                      fontFamily: 'Changa',
                      FontSize: 12,
                      color: AppTheme.getSecondaryTextColor(context),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
