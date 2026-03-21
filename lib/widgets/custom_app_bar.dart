import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool showLogo;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.showLogo = false,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return AppBar(
      centerTitle: centerTitle,
      elevation: 0,
      backgroundColor: isDark ? AppTheme.darkSurface : AppTheme.lightSurface,
      foregroundColor: AppTheme.getTextColor(context),
      title: showLogo
          ? _buildLogo()
          : (title != null
              ? Text(title!, style: const TextStyle(fontFamily: 'Changa', fontWeight: FontWeight.w600))
              : null),
      actions: actions ?? [
        IconButton(icon: const Icon(Icons.search), onPressed: () => Navigator.pushNamed(context, '/search')),
        IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () => Navigator.pushNamed(context, '/notifications')),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildLogo() {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('FLEX', style: TextStyle(color: AppTheme.goldColor, fontWeight: FontWeight.bold, fontSize: 22, fontFamily: 'Changa')),
        SizedBox(width: 4),
        Text('YEMEN', style: TextStyle(color: AppTheme.goldLight, fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'Changa')),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
