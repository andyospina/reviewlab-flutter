import 'package:material_ui/material_ui.dart';

import '../data/mock_data.dart';
import '../theme/app_colors.dart';
import '../widgets/app_top_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/like_button.dart';
import '../widgets/star_rating.dart';

/// Pantalla 4 · Detalle de producto (`ProductDetailScreen.kt`): foto, resumen, acciones y reseñas destacadas.
class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  final Product _product = MockData.featuredProduct;
  bool _saved = false;
  late List<Review> _reviews = MockData.reviewsForProduct(_product.id)
      .take(3)
      .toList();

  void _toggleLike(int index) {
    final r = _reviews[index];
    setState(() {
      _reviews = [..._reviews]
        ..[index] = Review(
          id: r.id,
          productId: r.productId,
          author: r.author,
          verifiedBuyer: r.verifiedBuyer,
          rating: r.rating,
          title: r.title,
          body: r.body,
          date: r.date,
          recommended: r.recommended,
          likesCount: r.likesCount + (r.likedByMe ? -1 : 1),
          likedByMe: !r.likedByMe,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'Producto',
        navigation: TopBarNavigation.back,
        actions: [
          Icon(
            Icons.more_vert,
            color: AppColors.graySecondary,
            semanticLabel: 'Más opciones',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 220,
              alignment: Alignment.center,
              color: AppColors.border.withValues(alpha: 0.35),
              child: const Text(
                'Foto del producto',
                style: TextStyle(color: AppColors.graySecondary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      StarRating(rating: _product.rating.round()),
                      Text(
                        '  ${_product.rating} · ${_product.reviewCount} reseñas · ${_product.recommendPercent}% recomiendan',
                        style: const TextStyle(
                          color: AppColors.graySecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          label: 'Escribir reseña',
                          height: 48,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomOutlinedButton(
                          label: _saved ? 'Guardado' : 'Guardar',
                          height: 48,
                          bold: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          onPressed: () => setState(() => _saved = !_saved),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Reseñas destacadas',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Ver todas >',
                        style: TextStyle(
                          color: AppColors.deepLime,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  for (var i = 0; i < _reviews.length; i++) ...[
                    _FeaturedReview(
                      review: _reviews[i],
                      onLike: () => _toggleLike(i),
                    ),
                    const SizedBox(height: 12),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeaturedReview extends StatelessWidget {
  const _FeaturedReview({required this.review, required this.onLike});

  final Review review;
  final VoidCallback onLike;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  review.author,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              StarRating(rating: review.rating, fontSize: 14),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            review.body,
            style: const TextStyle(
              color: AppColors.graySecondary,
              fontSize: 13,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: LikeButton(
              count: review.likesCount,
              liked: review.likedByMe,
              onTap: onLike,
            ),
          ),
        ],
      ),
    );
  }
}
