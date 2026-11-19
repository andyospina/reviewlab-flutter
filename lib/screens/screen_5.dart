import 'package:material_ui/material_ui.dart';

import '../data/mock_data.dart';
import '../theme/app_colors.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/like_button.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/star_rating.dart';

/// Pantalla 5 · Perfil (`ProfileScreen.kt`). Todo va en una sola lista con scroll: en Android los botones
/// ocupaban la pantalla y «Mis reseñas» quedaba aplastada; aquí nunca se desborda.
class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    const user = MockData.currentUser;
    const gap = SizedBox(height: 8);
    const sidePadding = EdgeInsets.symmetric(horizontal: 20);
    return Scaffold(
      bottomNavigationBar: const AppBottomNav(selectedIndex: 4),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: AppColors.ink,
            padding: EdgeInsets.fromLTRB(
              20,
              20 + MediaQuery.paddingOf(context).top,
              20,
              20,
            ),
            child: const _ProfileHeader(user: user),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _Stats(user: user),
          ),
          Padding(
            padding: sidePadding,
            child: CustomOutlinedButton(
              label: 'Editar perfil',
              onPressed: () {},
            ),
          ),
          gap,
          Padding(
            padding: sidePadding,
            child: CustomOutlinedButton(
              label: 'Productos guardados',
              onPressed: () {},
            ),
          ),
          gap,
          Padding(
            padding: sidePadding,
            child: CustomOutlinedButton(
              label: 'Reseñas que me gustaron',
              onPressed: () {},
            ),
          ),
          gap,
          Padding(
            padding: sidePadding,
            child: CustomOutlinedButton(
              label: 'Seleccionar imagen',
              onPressed: () {},
            ),
          ),
          gap,
          Padding(
            padding: sidePadding,
            child: CustomOutlinedButton(
              label: 'Cerrar sesión',
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: sidePadding,
            child: _ThemeSwitch(
              value: _darkMode,
              onChanged: (v) => setState(() => _darkMode = v),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: sidePadding,
            child: Text(
              'Mis reseñas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          for (final review in MockData.myReviews)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
              child: _MyReviewCard(review: review),
            ),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.user});

  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProfileAvatar(
              size: 64,
              asset: 'assets/images/avatar_emily.png',
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    style: const TextStyle(color: AppColors.graySecondary),
                  ),
                  Text(
                    user.country,
                    style: const TextStyle(color: AppColors.graySecondary),
                  ),
                  Text(
                    'Miembro desde ${user.memberSinceYear}',
                    style: const TextStyle(color: AppColors.graySecondary),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      user.bio,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          user.email,
          style: const TextStyle(color: AppColors.graySecondary),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 20,
          children: [
            _Counter(value: user.followers, label: 'Seguidores'),
            _Counter(value: user.following, label: 'Siguiendo'),
          ],
        ),
      ],
    );
  }
}

class _Counter extends StatelessWidget {
  const _Counter({required this.value, required this.label});

  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$value ',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: label,
              style: const TextStyle(color: AppColors.graySecondary),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stats extends StatelessWidget {
  const _Stats({required this.user});

  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _Stat(value: '${user.reviewCount}', label: 'Reseñas'),
        _Stat(value: '${user.likesReceived}', label: 'Likes recibidos'),
        _Stat(
          value: '${user.averageRating}★',
          label: 'Promedio',
          color: AppColors.deepLime,
        ),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label, this.color});

  final String value;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: color,
            height: 1.3,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColors.graySecondary),
        ),
      ],
    );
  }
}

class _ThemeSwitch extends StatelessWidget {
  const _ThemeSwitch({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      radius: 10,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Icon(value ? Icons.dark_mode : Icons.light_mode),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                'Modo oscuro',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: AppColors.electricLime,
            activeThumbColor: AppColors.ink,
          ),
        ],
      ),
    );
  }
}

class _MyReviewCard extends StatelessWidget {
  const _MyReviewCard({required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    final draft = !review.published;
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    MockData.productName(review.productId),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              StarRating(rating: review.rating, fontSize: 14),
            ],
          ),
          Text(
            review.title,
            style: TextStyle(
              fontSize: 13,
              color: draft ? AppColors.graySecondary : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    review.date,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.graySecondary,
                    ),
                  ),
                ),
                LikeButton(count: review.likesCount, liked: review.likedByMe),
                const SizedBox(width: 8),
                Text(
                  draft ? 'Borrador' : 'Publicada',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: draft ? AppColors.graySecondary : AppColors.deepLime,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text('Editar')),
              TextButton(onPressed: () {}, child: const Text('Eliminar')),
            ],
          ),
        ],
      ),
    );
  }
}
