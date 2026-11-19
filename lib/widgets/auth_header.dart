import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import 'app_logo.dart';

/// Cabecera oscura de Login y Registro: logo de 80, título y frase (`LoginScreen.kt`).
class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.tagline});

  final String title;
  final String tagline;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.ink,
      padding: EdgeInsets.fromLTRB(
        24,
        40 + MediaQuery.paddingOf(context).top,
        24,
        40,
      ),
      child: Column(
        children: [
          const AppLogo(size: 80),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            tagline,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.graySecondary),
          ),
        ],
      ),
    );
  }
}
