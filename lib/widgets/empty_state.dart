import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'custom_button.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(color: AppTheme.goldColor.withOpacity(0.1), shape: BoxShape.circle),
              child: Icon(icon, size: 50, color: AppTheme.goldColor),
            ),
            const SizedBox(height: 24),
            Text(title, textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Changa', fontSize: 20, fontWeight: FontWeight.w600, color: AppTheme.getTextColor(context))),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(subtitle!, textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Changa', fontSize: 14, color: AppTheme.getSecondaryTextColor(context))),
            ],
            if (buttonText != null && onButtonPressed != null) ...[
              const SizedBox(height: 24),
              CustomButton(text: buttonText!, onPressed: onButtonPressed, width: 200),
            ],
          ],
        ),
      ),
    );
  }
}

class NoDataState extends StatelessWidget {
  final String? message;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const NoDataState({super.key, this.message, this.buttonText, this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.inbox_outlined,
      title: message ?? 'لا توجد بيانات',
      subtitle: 'لم يتم العثور على أي عناصر حالياً',
      buttonText: buttonText,
      onButtonPressed: onButtonPressed,
    );
  }
}
