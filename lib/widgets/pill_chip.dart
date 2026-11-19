import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Chip redondeado de categorías y filtros (`ChipsCategorias.kt` / `FiltrosResenas.kt`).
/// [dark] usa el estilo de los filtros de reseñas (tinta al seleccionar) en vez del lima.
class PillChip extends StatelessWidget {
  const PillChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.dark = false,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final Color background;
    final Color borderColor;
    final Color textColor;
    if (selected) {
      background = dark ? AppColors.ink : AppColors.electricLime;
      borderColor = background;
      textColor = dark ? AppColors.paper : AppColors.ink;
    } else {
      background = Colors.transparent;
      borderColor = AppColors.border;
      textColor = AppColors.ink;
    }
    return Material(
      color: background,
      shape: StadiumBorder(side: BorderSide(color: borderColor)),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: dark || !selected
                  ? (dark ? FontWeight.w500 : FontWeight.normal)
                  : FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
