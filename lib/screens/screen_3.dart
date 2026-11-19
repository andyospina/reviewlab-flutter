import 'package:material_ui/material_ui.dart';

import '../data/mock_data.dart';
import '../theme/app_colors.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/app_top_bar.dart';
import '../widgets/pill_chip.dart';
import '../widgets/product_list_item.dart';
import '../widgets/profile_avatar.dart';

/// Pantalla 3 · Inicio (`HomeScreen.kt`): barra superior con acciones, buscador, categorías y tendencias.
class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  String _category = MockData.categories.first;

  @override
  Widget build(BuildContext context) {
    // La lista de ejemplo no filtra por categoría (igual que el primer sprint de Android): solo cambia el chip.
    const products = MockData.products;
    return Scaffold(
      appBar: AppTopBar(
        actions: const [
          Icon(
            Icons.map,
            color: AppColors.ink,
            semanticLabel: 'Mapa de reseñas',
          ),
          SizedBox(width: 12),
          Icon(
            Icons.notifications,
            color: AppColors.ink,
            semanticLabel: 'Notificaciones',
          ),
          SizedBox(width: 12),
          ProfileAvatar(size: 36, asset: 'assets/images/avatar_emily.png'),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(selectedIndex: 0),
      // Todo en una sola lista con scroll: en horizontal o con letra grande el buscador, las categorías y
      // el título no dejaban espacio a la lista y la pantalla se desbordaba.
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const _SearchBar(),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final category in MockData.categories) ...[
                  PillChip(
                    label: category,
                    selected: category == _category,
                    onTap: () => setState(() => _category = category),
                  ),
                  if (category != MockData.categories.last)
                    const SizedBox(width: 8),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Tendencias esta semana',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          for (final product in products) ...[
            ProductListItem(product: product),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: AppColors.graySecondary),
          Expanded(
            child: Text(
              '  Busca un producto...',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: AppColors.graySecondary),
            ),
          ),
        ],
      ),
    );
  }
}
