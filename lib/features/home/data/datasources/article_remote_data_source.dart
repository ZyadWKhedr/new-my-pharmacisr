import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:new_my_pharmacist/features/home/data/models/article.dart';

class ArticleRemoteDataSource {
  final _client = Supabase.instance.client;

  Future<List<Article>> fetchArticles({int limit = 10}) async {
    try {
      print('Attempting to fetch articles from Supabase...');
      final data = await _client
          .from('articles') // Ensure the table name is correct
          .select('*') // Explicitly select all columns
          .limit(limit);

      print('Received data: $data');
      return data.map((json) => Article.fromJson(json)).toList();
    } catch (e) {
      print('Supabase error details: $e');
      if (e is PostgrestException) {
        if (e.code == '404') {
          print(
            'Table "articles" may not exist or you don\'t have permission to access it',
          );
        }
      }
      throw Exception('Failed to fetch articles: $e');
    }
  }
}
