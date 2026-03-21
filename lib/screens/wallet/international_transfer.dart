import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class InternationalTransferScreen extends StatefulWidget {
  const InternationalTransferScreen({super.key});

  @override
  State<InternationalTransferScreen> createState() => _InternationalTransferScreenState();
}

class _InternationalTransferScreenState extends State<InternationalTransferScreen> {
  final List<String> countries = ['السعودية', 'الإمارات', 'مصر', 'الأردن', 'تركيا'];
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'تحويل دولي'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedCountry,
              decoration: const InputDecoration(labelText: 'الدولة'),
              items: countries.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (v) => setState(() => selectedCountry = v),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'اسم المستلم'),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'رقم الحساب / IBAN'),
            ),
            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'المبلغ'),
            ),
            const SizedBox(height: 32),
            CustomButton(text: 'إرسال التحويل', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
