import 'package:material_ui/material_ui.dart';

import '../data/mock_data.dart';
import '../theme/app_colors.dart';
import 'custom_card.dart';
import 'like_button.dart';
import 'star_rating.dart';

/// Tarjeta de una reseña (`TarjetaResena.kt`): autor + insignia + estrellas, título, cuerpo y pie
/// con fecha, comentar, compartir y like. Nombres largos y pies estrechos se recortan con «…».
class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.review,
    this.onLike,
    this.showActions = true,
  });

  final Review review;
  final VoidCallback? onLike;
  final bool showActions;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        review.author,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (review.verifiedBuyer) ...[
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.check_circle,
                        size: 14,
                        color: AppColors.deepLime,
                      ),
                      const Flexible(
                        child: Text(
                          ' Comprador verificado',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.deepLime,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              StarRating(rating: review.rating, fontSize: 14),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            review.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            review.body,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.graySecondary,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        review.date,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.graySecondary,
                        ),
                      ),
                    ),
                    if (review.recommended)
                      const Flexible(
                        child: Text(
                          ' · Recomendado',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.deepLime,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (showActions) ...[
                const _IconAction(
                  icon: Icons.comment_outlined,
                  label: 'Comentar',
                ),
                const SizedBox(width: 4),
                const _IconAction(
                  icon: Icons.share_outlined,
                  semantic: 'Compartir reseña',
                ),
                const SizedBox(width: 4),
              ],
              LikeButton(
                count: review.likesCount,
                liked: review.likedByMe,
                onTap: onLike,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconAction extends StatelessWidget {
  const _IconAction({required this.icon, this.label, this.semantic});

  final IconData icon;
  final String? label;
  final String? semantic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: AppColors.graySecondary,
            semanticLabel: semantic,
          ),
          if (label != null) ...[
            const SizedBox(width: 4),
            Text(
              label!,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.graySecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
