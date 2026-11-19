import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Botón principal: lima con texto tinta, 52 de alto y esquinas de 6 (`BotonIniciarSesion.kt`).
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.height = 52,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final double height;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final button = FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.electricLime,
        foregroundColor: AppColors.ink,
        disabledBackgroundColor: AppColors.ink.withValues(alpha: 0.12),
        disabledForegroundColor: AppColors.ink.withValues(alpha: 0.38),
        minimumSize: Size(expand ? double.infinity : 0, height),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          letterSpacing: 0.1,
          height: 1.4,
        ),
      ),
      child: Text(label, textAlign: TextAlign.center),
    );
    return SizedBox(height: height, child: button);
  }
}

/// Botón con borde (OutlinedButton de Material 3: forma de píldora, texto DeepLime).
class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.height = 40,
    this.bold = false,
    this.shape,
  });

  final String label;
  final VoidCallback? onPressed;
  final double height;
  final bool bold;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.deepLime,
          disabledForegroundColor: AppColors.ink.withValues(alpha: 0.38),
          side: const BorderSide(color: AppColors.border),
          shape: shape ?? const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontSize: 14,
            letterSpacing: 0.1,
            height: 1.4,
            fontWeight: bold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        child: Text(label, textAlign: TextAlign.center),
      ),
    );
  }
}
