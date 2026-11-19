import 'package:material_ui/material_ui.dart';

import '../data/mock_data.dart';
import '../theme/app_colors.dart';
import 'custom_card.dart';
import 'star_rating.dart';

/// Fila de producto en tendencia (`ProductListItem.kt`): miniatura, nombre, estrellas y flecha.
class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.product, this.onTap});

  final Product product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      radius: 10,
      padding: const EdgeInsets.all(12),
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.border.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      StarRating(rating: product.rating.round(), fontSize: 13),
                      Text(
                        '  ${product.rating} · ${product.reviewCount} reseñas',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.graySecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: AppColors.graySecondary,
          ),
        ],
      ),
    );
  }
}
