import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:new_my_pharmacist/features/home/data/datasources/article_remote_data_source.dart';
import 'package:new_my_pharmacist/features/home/data/repositories/article_repository_impl.dart';
import 'package:new_my_pharmacist/features/home/domain/repositories/article_repository.dart';
import 'package:new_my_pharmacist/features/home/domain/usecases/get_random_articles.dart';
import 'package:new_my_pharmacist/features/home/domain/entities/article_entity.dart';

// HTTP Client provider
final httpClientProvider = Provider<http.Client>((ref) {
  return http.Client();
});

// Remote Data Source provider
final articleRemoteDataSourceProvider = Provider<ArticleRemoteDataSource>((
  ref,
) {
  return ArticleRemoteDataSource(); // Using your custom remote data source
});

// Repository provider
final articleRepositoryProvider = Provider<ArticleRepository>((ref) {
  return ArticleRepositoryImpl(ref.read(articleRemoteDataSourceProvider));
});

// Main articles provider to fetch data from the repository
final articlesProvider = FutureProvider<List<ArticleEntity>>((ref) async {
  final repository = ref.read(articleRepositoryProvider);
  return await repository.getRandomArticles(); // Fetch articles from repository
});

// UseCase provider
final getRandomArticlesProvider = Provider<GetRandomArticles>((ref) {
  return GetRandomArticles(ref.read(articleRepositoryProvider));
});
