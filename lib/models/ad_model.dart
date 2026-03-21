import 'package:flutter/material.dart';

class AdModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final String currency;
  final List<String> images;
  final String category;
  final String city;
  final String sellerId;
  final String sellerName;
  final DateTime createdAt;
  final bool isFeatured;

  AdModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.currency,
    required this.images,
    required this.category,
    required this.city,
    required this.sellerId,
    required this.sellerName,
    required this.createdAt,
    this.isFeatured = false,
  });

  String get formattedPrice {
    if (price >= 1000000) {
      return '${(price / 1000000).toStringAsFixed(1)}M';
    } else if (price >= 1000) {
      return '${(price / 1000).toStringAsFixed(0)}K';
    }
    return price.toStringAsFixed(0);
  }
}
