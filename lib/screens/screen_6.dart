import 'package:material_ui/material_ui.dart';

import '../data/mock_data.dart';
import '../theme/app_colors.dart';
import '../widgets/app_top_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/pill_chip.dart';
import '../widgets/review_card.dart';
import '../widgets/star_rating.dart';

enum _Order { recent, bestRated, mostLiked }

/// Pantalla 6 · Lista de reseñas (`ReviewsListScreen.kt`): encabezado con promedio, filtros y tarjetas.
class Screen6 extends StatefulWidget {
  const Screen6({super.key});

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  final Product _product = MockData.featuredProduct;
  _Order _order = _Order.recent;
  bool _withPhotos = false;
  int _visible = 3;

  List<Review> get _filtered {
    var list = MockData.reviewsForProduct(_product.id);
    if (_withPhotos) list = list.where((r) => r.hasPhoto).toList();
    switch (_order) {
      case _Order.recent:
        break;
      case _Order.bestRated:
        list = [...list]..sort((a, b) => b.rating.compareTo(a.rating));
      case _Order.mostLiked:
        list = [...list]..sort((a, b) => b.likesCount.compareTo(a.likesCount));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final reviews = _filtered;
    final shown = reviews.take(_visible).toList();
    return Scaffold(
      appBar: const AppTopBar(
        navigation: TopBarNavigation.back,
        actions: [
          Icon(
            Icons.more_vert,
            color: AppColors.graySecondary,
            semanticLabel: 'Más opciones',
          ),
        ],
      ),
      // Encabezado, filtros y tarjetas en una sola lista: con letra grande el encabezado fijo se comía la pantalla.
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Reseñas (${_product.reviewCount})',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
              ),
              StarRating(rating: _product.rating.round()),
              Text(
                '  ${_product.rating}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PillChip(
                  dark: true,
                  label: 'Recientes',
                  selected: _order == _Order.recent,
                  onTap: () => setState(() => _order = _Order.recent),
                ),
                const SizedBox(width: 8),
                PillChip(
                  dark: true,
                  label: 'Mejor valoradas',
                  selected: _order == _Order.bestRated,
                  onTap: () => setState(() => _order = _Order.bestRated),
                ),
                const SizedBox(width: 8),
                PillChip(
                  dark: true,
                  label: 'Más gustadas',
                  selected: _order == _Order.mostLiked,
                  onTap: () => setState(() => _order = _Order.mostLiked),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: PillChip(
              dark: true,
              label: 'Con fotos',
              selected: _withPhotos,
              onTap: () => setState(() => _withPhotos = !_withPhotos),
            ),
          ),
          const SizedBox(height: 16),
          for (final review in shown) ...[
            ReviewCard(review: review),
            const SizedBox(height: 12),
          ],
          if (_visible < reviews.length)
            CustomOutlinedButton(
              label: 'Cargar más reseñas',
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () => setState(() => _visible += 3),
            ),
        ],
      ),
    );
  }
}
