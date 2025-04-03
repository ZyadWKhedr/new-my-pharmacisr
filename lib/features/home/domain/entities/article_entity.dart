class ArticleEntity {
  final String id;
  final String title;
  final String content;
  final String imageurl;
  final DateTime createdAt;

  ArticleEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.imageurl,
    required this.createdAt,
  });
}
