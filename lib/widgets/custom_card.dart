import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Contenedor con borde fino y esquinas redondeadas que usan las tarjetas de la app
/// (reseñas: radio 8 / padding 16, productos: radio 10 / padding 12).
class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.child,
    this.radius = 8,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
  });

  final Widget child;
  final double radius;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
      side: const BorderSide(color: AppColors.border),
    );
    return Material(
      color: Colors.transparent,
      shape: shape,
      child: InkWell(
        customBorder: shape,
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: SizedBox(width: double.infinity, child: child),
        ),
      ),
    );
  }
}
