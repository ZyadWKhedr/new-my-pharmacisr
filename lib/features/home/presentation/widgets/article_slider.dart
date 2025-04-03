import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_my_pharmacist/features/home/domain/entities/article_entity.dart';
import 'package:new_my_pharmacist/features/home/presentation/providers/article_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleCarousel extends ConsumerWidget {
  const ArticleCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesAsync = ref.watch(articlesProvider);

    return articlesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
      data: (articles) {
        if (articles.isEmpty) {
          return const Center(child: Text('No articles found'));
        }

        // Use StatefulBuilder to manage local state
        return StatefulBuilder(
          builder: (context, setState) {
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index, realIndex) {
                    final article = articles[index];
                    return _buildArticleCard(context, article);
                  },
                  options: CarouselOptions(
                    height: 280.h,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                  ),
                ),
                const SizedBox(height: 12),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildArticleCard(BuildContext context, ArticleEntity article) {
    return GestureDetector(
      onTap: () => _launchURL(article.content),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.network(
                article.imageurl,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => Container(
                      height: 200,
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                article.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
