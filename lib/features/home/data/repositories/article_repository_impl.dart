import 'package:new_my_pharmacist/features/home/domain/entities/article_entity.dart';
import 'package:new_my_pharmacist/features/home/domain/repositories/article_repository.dart';

import '../datasources/article_remote_data_source.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource remoteDataSource;

  ArticleRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ArticleEntity>> getRandomArticles() async {
    try {
      final articles = await remoteDataSource.fetchArticles();
      return articles
          .map(
            (article) => ArticleEntity(
              id: article.id,
              title: article.title,
              content: article.content,
              imageurl: article.imageurl,
              createdAt: article.createdAt,
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to load articles: $e');
    }
  }
}
