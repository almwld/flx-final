import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseClient client = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> getProducts({
    String? category,
    String? subCategory,
  }) async {
    var query = client.from('products').select();
    if (category != null) {
      query = query.eq('category', category);
    }
    final response = await query;
    return response as List<Map<String, dynamic>>;
  }

  static Future<void> createOrder(Map<String, dynamic> data) async {
    await client.from('orders').insert(data);
  }
}
