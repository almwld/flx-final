import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class CommissionScreen extends StatefulWidget {
  const CommissionScreen({super.key});

  @override
  State<CommissionScreen> createState() => _CommissionScreenState();
}

class _CommissionScreenState extends State<CommissionScreen> {
  double _totalCommission = 12500;
  double _pendingCommission = 3400;
  double _withdrawnCommission = 9100;
  String _selectedPeriod = 'month';

  final List<Map<String, dynamic>> _commissionHistory = [
    {'date': '2024-01-20', 'order': '#1001', 'amount': 450, 'status': 'paid'},
    {'date': '2024-01-19', 'order': '#1002', 'amount': 1200, 'status': 'paid'},
    {'date': '2024-01-18', 'order': '#1003', 'amount': 850, 'status': 'pending'},
    {'date': '2024-01-17', 'order': '#1004', 'amount': 230, 'status': 'paid'},
    {'date': '2024-01-16', 'order': '#1005', 'amount': 670, 'status': 'pending'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'العمولات'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 16),
            _buildPeriodSelector(),
            const SizedBox(height: 16),
            _buildHistoryList(),
            const SizedBox(height: 24),
            _buildWithdrawButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppTheme.goldGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text('الرصيد الإجمالي', style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 8),
          Text(
            '${_totalCommission.toStringAsFixed(0)} ر.ي',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBalanceItem('معلق', _pendingCommission),
              _buildBalanceItem('مسحوب', _withdrawnCommission),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceItem(String label, double amount) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.black54)),
        const SizedBox(height: 4),
        Text(
          '${amount.toStringAsFixed(0)} ر.ي',
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildPeriodSelector() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppTheme.getCardColor(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
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
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _commissionHistory.length,
      itemBuilder: (context, index) {
        final item = _commissionHistory[index];
        final isPaid = item['status'] == 'paid';
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: isPaid ? Colors.green.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
              child: Icon(isPaid ? Icons.check : Icons.pending, color: isPaid ? Colors.green : Colors.orange),
            ),
            title: Text('عمولة طلب ${item['order']}'),
            subtitle: Text(item['date']),
            trailing: Text(
              '${item['amount']} ر.ي',
              style: TextStyle(
                color: isPaid ? Colors.green : Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWithdrawButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton.icon(
        onPressed: _pendingCommission > 0 ? () {} : null,
        icon: const Icon(Icons.money_off),
        label: const Text('سحب العمولات'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.goldColor,
          foregroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 50),
        ),
      ),
    );
  }
}
