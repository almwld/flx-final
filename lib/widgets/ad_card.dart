import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/product_model.dart';
import '../theme/app_theme.dart';

class AdCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const AdCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: CachedNetworkImage(
                imageUrl: product.images.isNotEmpty ? product.images.first : 'https://via.placeholder.com/300x200',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(height: 150, color: isDark ? AppTheme.darkSurface : AppTheme.lightSurface),
                errorWidget: (_, __, ___) => Container(height: 150, color: isDark ? AppTheme.darkSurface : AppTheme.lightSurface, child: const Icon(Icons.image_not_supported, color: AppTheme.goldColor)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Changa', fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.getTextColor(context))),
                  const SizedBox(height: 8),
                  Text('${product.price.toStringAsFixed(0)} ${_getCurrencySymbol(product.currency)}', style: const TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.goldColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getCurrencySymbol(String currency) {
    switch (currency) {
      case 'YER': return 'ر.ي';
      case 'SAR': return 'ر.س';
      case 'USD': return '\$';
      default: return currency;
    }
  }
}
