class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final double? oldPrice;
  final String currency;
  final List<String> images;
  final String category;
  final String sellerId;
  final String sellerName;
  final double rating;
  final int reviewCount;
  final String status;
  final DateTime createdAt;
  final bool isAuction;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.oldPrice,
    this.currency = 'YER',
    required this.images,
    required this.category,
    required this.sellerId,
    required this.sellerName,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.status = 'active',
    required this.createdAt,
    this.isAuction = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      oldPrice: json['old_price']?.toDouble(),
      currency: json['currency'] ?? 'YER',
      images: List<String>.from(json['images'] ?? []),
      category: json['category'] ?? '',
      sellerId: json['seller_id'] ?? '',
      sellerName: json['seller_name'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['review_count'] ?? 0,
      status: json['status'] ?? 'active',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : DateTime.now(),
      isAuction: json['is_auction'] ?? false,
    );
  }
}
