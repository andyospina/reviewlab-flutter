import 'package:material_ui/material_ui.dart';

/// Barra inferior con las 5 secciones principales (`AppBottomNavBar.kt`).
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key, required this.selectedIndex, this.onSelected});

  final int selectedIndex;
  final ValueChanged<int>? onSelected;

  static const _items = [
    (Icons.home_outlined, Icons.home, 'Inicio'),
    (Icons.search, Icons.search, 'Buscar'),
    (Icons.group_outlined, Icons.group, 'Siguiendo'),
    (Icons.rate_review_outlined, Icons.rate_review, 'Reseñar'),
    (Icons.person_outline, Icons.person, 'Perfil'),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onSelected,
      destinations: [
        for (final item in _items)
          NavigationDestination(
            icon: Icon(item.$1),
            selectedIcon: Icon(item.$2),
            label: item.$3,
          ),
      ],
    );
  }
}
