import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Foto de perfil circular sobre fondo lima. Sin [asset] muestra el ícono por defecto, como en Android.
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, required this.size, this.asset});

  final double size;
  final String? asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: AppColors.electricLime,
        shape: BoxShape.circle,
      ),
      child: asset != null
          ? Image.asset(
              asset!,
              fit: BoxFit.cover,
              semanticLabel: 'Foto de perfil',
            )
          : Icon(
              Icons.person,
              size: size * 0.6,
              color: AppColors.ink,
              semanticLabel: 'Foto de perfil',
            ),
    );
  }
}
