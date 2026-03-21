import 'product_model.dart';

class DummyData {
  static List<ProductModel> getProducts() {
    return [
      ProductModel(
        id: '1',
        title: 'آيفون 15 برو ماكس',
        description: 'هاتف أيفون جديد',
        price: 450000,
        currency: 'YER',
        images: ['https://picsum.photos/id/1/300/300'],
        category: 'إلكترونيات',
        sellerId: 'seller1',
        sellerName: 'متجر التقنية',
        createdAt: DateTime.now(),
      ),
    ];
  }
}
