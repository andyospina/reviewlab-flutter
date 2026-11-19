import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import 'app_logo.dart';

enum TopBarNavigation { none, menu, back }

/// Barra superior lima de 58 de alto (`BarraSuperior.kt`): navegación, logo, título y acciones.
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    super.key,
    this.title = 'ReviewLab',
    this.navigation = TopBarNavigation.menu,
    this.onNavigationTap,
    this.actions = const [],
  });

  final String title;
  final TopBarNavigation navigation;
  final VoidCallback? onNavigationTap;
  final List<Widget> actions;

  @override
  Size get preferredSize => const Size.fromHeight(58);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.electricLime,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 58,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                if (navigation != TopBarNavigation.none) ...[
                  GestureDetector(
                    onTap: onNavigationTap,
                    behavior: HitTestBehavior.opaque,
                    child: Icon(
                      navigation == TopBarNavigation.menu
                          ? Icons.menu
                          : Icons.arrow_back,
                      color: AppColors.ink,
                      semanticLabel: navigation == TopBarNavigation.menu
                          ? 'Menú'
                          : 'Volver',
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                const AppLogo(
                  size: 28,
                  bubbleColor: AppColors.ink,
                  markColor: AppColors.electricLime,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ink,
                      height: 1.4,
                    ),
                  ),
                ),
                ...actions,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
