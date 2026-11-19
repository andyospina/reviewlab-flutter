import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Corazón con la cantidad de likes; lleno y rojo si el usuario ya dio like (`BotonLike.kt`).
class LikeButton extends StatelessWidget {
  const LikeButton({
    super.key,
    required this.count,
    required this.liked,
    this.onTap,
  });

  final int count;
  final bool liked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = liked ? AppColors.likeRed : AppColors.graySecondary;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              liked ? Icons.favorite : Icons.favorite_border,
              size: 18,
              color: color,
              semanticLabel: liked ? 'Quitar me gusta' : 'Me gusta',
            ),
            const SizedBox(width: 4),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 13,
                color: color,
                fontWeight: liked ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
