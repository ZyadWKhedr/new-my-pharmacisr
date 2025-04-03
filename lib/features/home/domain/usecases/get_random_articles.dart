import 'package:new_my_pharmacist/features/home/domain/entities/article_entity.dart';
import 'package:new_my_pharmacist/features/home/domain/repositories/article_repository.dart';

class GetRandomArticles {
  final ArticleRepository repository;

  GetRandomArticles(this.repository);

  Future<List<ArticleEntity>> call() async {
    return await repository.getRandomArticles();
  }
}
