import '../../domain/entities/article_entity.dart';

class Article extends ArticleEntity {
  Article({
    required super.id,
    required super.title,
    required super.content,
    required super.imageurl,
    required super.createdAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    // Safely parse fields and provide defaults in case of null values
    return Article(
      id: json['id'] as String? ?? 'Unknown ID', // Default if null
      title: json['title'] as String? ?? 'Untitled', // Default if null
      content:
          json['content'] as String? ??
          'No content available', // Default if null
      imageurl:
          json['imageurl'] as String? ?? '', // Default empty string if null
      createdAt:
          json['createdAt'] != null
              ? DateTime.tryParse(json['createdAt']) ??
                  DateTime.utc(1970, 1, 1) // Default if invalid date
              : DateTime.utc(1970, 1, 1), // Default to epoch date if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'imageurl': imageurl,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
