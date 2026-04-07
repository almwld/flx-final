import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class SellerAnalyticsScreen extends StatefulWidget {
  const SellerAnalyticsScreen({super.key});

  @override
  State<SellerAnalyticsScreen> createState() => _SellerAnalyticsScreenState();
}

class _SellerAnalyticsScreenState extends State<SellerAnalyticsScreen> {
  String _selectedPeriod = 'week';
  final List<Map<String, dynamic>> _dailySales = [
    {'day': 'الأحد', 'sales': 12500},
    {'day': 'الإثنين', 'sales': 15800},
    {'day': 'الثلاثاء', 'sales': 14200},
    {'day': 'الأربعاء', 'sales': 18900},
    {'day': 'الخميس', 'sales': 22100},
    {'day': 'الجمعة', 'sales': 19800},
    {'day': 'السبت', 'sales': 16700},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'إحصائيات المتجر'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildPeriodSelector(),
            const SizedBox(height: 16),
            _buildStatsGrid(),
            const SizedBox(height: 24),
            _buildSalesChart(),
            const SizedBox(height: 24),
            _buildTopProducts(),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodSelector() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppTheme.getCardColor(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildPeriodTab('يوم', 'day'),
          _buildPeriodTab('أسبوع', 'week'),
          _buildPeriodTab('شهر', 'month'),
          _buildPeriodTab('سنة', 'year'),
        ],
      ),
    );
  }

  Widget _buildPeriodTab(String title, String value) {
    final isSelected = _selectedPeriod == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedPeriod = value),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.goldColor : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.black : AppTheme.getTextColor(context),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: [
        _buildStatCard('إجمالي المبيعات', '125,000 ر.ي', Icons.attach_money, Colors.green),
        _buildStatCard('عدد الطلبات', '45', Icons.shopping_bag, Colors.blue),
        _buildStatCard('الزيارات', '1,234', Icons.visibility, Colors.orange),
        _buildStatCard('التقييم', '4.8', Icons.star, Colors.amber),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('المبيعات اليومية', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: Row(
                children: _dailySales.map((sale) {
                  final height = (sale['sales'] / 25000) * 150;
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 30,
                              height: height,
                              decoration: BoxDecoration(
                                color: AppTheme.goldColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(sale['day'], style: const TextStyle(fontSize: 10)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopProducts() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('المنتجات الأكثر مبيعاً', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildProductItem('آيفون 15 برو', 45, 450000),
            _buildProductItem('سامسونج S24', 32, 380000),
            _buildProductItem('ماك بوك برو', 28, 1800000),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(String name, int sales, int price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(child: Text(name)),
          Text('$sales قطعة'),
          const SizedBox(width: 16),
          Text('${(price * sales).toStringAsFixed(0)} ر.ي', style: const TextStyle(color: AppTheme.goldColor)),
        ],
      ),
    );
  }
}
