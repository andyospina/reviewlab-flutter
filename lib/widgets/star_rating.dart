import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Estrellas llenas (DeepLime) y vacías (gris) como texto, igual que `StarRatingDisplay.kt`.
class StarRating extends StatelessWidget {
  const StarRating({
    super.key,
    required this.rating,
    this.fontSize = 16,
    this.maxStars = 5,
  });

  final int rating;
  final double fontSize;
  final int maxStars;

  @override
  Widget build(BuildContext context) {
    final filled = rating.clamp(0, maxStars);
    return Semantics(
      label: '$filled de $maxStars estrellas',
      child: ExcludeSemantics(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '★' * filled,
                style: const TextStyle(color: AppColors.deepLime),
              ),
              TextSpan(
                text: '☆' * (maxStars - filled),
                style: const TextStyle(color: AppColors.graySecondary),
              ),
            ],
          ),
          style: TextStyle(fontSize: fontSize, height: 1.3),
        ),
      ),
    );
  }
}
