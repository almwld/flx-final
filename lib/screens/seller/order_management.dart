import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class OrderManagementScreen extends StatefulWidget {
  const OrderManagementScreen({super.key});

  @override
  State<OrderManagementScreen> createState() => _OrderManagementScreenState();
}

class _OrderManagementScreenState extends State<OrderManagementScreen> {
  String _selectedStatus = 'all';
  final List<Map<String, dynamic>> _orders = [
    {'id': '#1001', 'customer': 'أحمد علي', 'amount': 45000, 'status': 'new', 'date': '2024-01-20'},
    {'id': '#1002', 'customer': 'فاطمة محمد', 'amount': 120000, 'status': 'processing', 'date': '2024-01-19'},
    {'id': '#1003', 'customer': 'محمد عبدالله', 'amount': 85000, 'status': 'shipped', 'date': '2024-01-18'},
    {'id': '#1004', 'customer': 'سارة أحمد', 'amount': 23000, 'status': 'delivered', 'date': '2024-01-17'},
    {'id': '#1005', 'customer': 'يوسف حسين', 'amount': 67000, 'status': 'cancelled', 'date': '2024-01-16'},
  ];

  List<Map<String, dynamic>> get _filteredOrders {
    if (_selectedStatus == 'all') return _orders;
    return _orders.where((o) => o['status'] == _selectedStatus).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'إدارة الطلبات'),
      body: Column(
        children: [
          _buildStatusFilter(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredOrders.length,
              itemBuilder: (context, index) {
                final order = _filteredOrders[index];
                return _buildOrderCard(order);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusFilter() {
    final statuses = [
      {'key': 'all', 'label': 'الكل', 'color': Colors.grey},
      {'key': 'new', 'label': 'جديد', 'color': Colors.blue},
      {'key': 'processing', 'label': 'قيد التجهيز', 'color': Colors.orange},
      {'key': 'shipped', 'label': 'تم الشحن', 'color': Colors.purple},
      {'key': 'delivered', 'label': 'تم التسليم', 'color': Colors.green},
      {'key': 'cancelled', 'label': 'ملغي', 'color': Colors.red},
    ];

    return Container(
      height: 50,
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: statuses.length,
        itemBuilder: (context, index) {
          final status = statuses[index];
          final isSelected = _selectedStatus == status['key'];
          return GestureDetector(
            onTap: () => setState(() => _selectedStatus = status['key']!),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? status['color'] : AppTheme.getCardColor(context),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  status['label']!,
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppTheme.getTextColor(context),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    final statusColor = {
      'new': Colors.blue,
      'processing': Colors.orange,
      'shipped': Colors.purple,
      'delivered': Colors.green,
      'cancelled': Colors.red,
    }[order['status']] ?? Colors.grey;

    final statusText = {
      'new': 'جديد',
      'processing': 'قيد التجهيز',
      'shipped': 'تم الشحن',
      'delivered': 'تم التسليم',
      'cancelled': 'ملغي',
    }[order['status']] ?? order['status'];

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(order['id'], style: const TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(statusText, style: TextStyle(color: statusColor)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(order['customer']),
            const SizedBox(height: 4),
            Text(order['date'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${order['amount']} ر.ي', style: const TextStyle(color: AppTheme.goldColor, fontWeight: FontWeight.bold)),
                _buildActionButtons(order),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(Map<String, dynamic> order) {
    if (order['status'] == 'delivered' || order['status'] == 'cancelled') {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        if (order['status'] == 'new')
          TextButton(
            onPressed: () {},
            child: const Text('تجهيز', style: TextStyle(color: Colors.orange)),
          ),
        if (order['status'] == 'processing')
          TextButton(
            onPressed: () {},
            child: const Text('شحن', style: TextStyle(color: Colors.purple)),
          ),
        if (order['status'] == 'shipped')
          TextButton(
            onPressed: () {},
            child: const Text('تسليم', style: TextStyle(color: Colors.green)),
          ),
        TextButton(
          onPressed: () {},
          child: const Text('إلغاء', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
