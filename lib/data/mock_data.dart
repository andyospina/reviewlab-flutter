/// Datos quemados: copia de `LocalProductProvider`, `LocalReviewProvider` y `LocalUserProvider` de Android.
class Product {
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.recommendPercent,
  });

  final String id;
  final String name;
  final String category;
  final double rating;
  final int reviewCount;
  final int recommendPercent;
}

class Review {
  const Review({
    required this.id,
    required this.productId,
    required this.author,
    required this.verifiedBuyer,
    required this.rating,
    required this.title,
    required this.body,
    required this.date,
    this.recommended = false,
    this.likesCount = 0,
    this.likedByMe = false,
    this.hasPhoto = false,
    this.published = true,
  });

  final String id;
  final String productId;
  final String author;
  final bool verifiedBuyer;
  final int rating;
  final String title;
  final String body;
  final String date;
  final bool recommended;
  final int likesCount;
  final bool likedByMe;
  final bool hasPhoto;
  final bool published;
}

class UserProfile {
  const UserProfile({
    required this.name,
    required this.username,
    required this.email,
    required this.country,
    required this.bio,
    required this.memberSinceYear,
    required this.reviewCount,
    required this.likesReceived,
    required this.averageRating,
    required this.followers,
    required this.following,
  });

  final String name;
  final String username;
  final String email;
  final String country;
  final String bio;
  final int memberSinceYear;
  final int reviewCount;
  final int likesReceived;
  final double averageRating;
  final int followers;
  final int following;
}

class MockData {
  MockData._();

  static const categories = [
    'Todo',
    'Electrónica',
    'Hogar',
    'Deportes',
    'Libros',
    'Moda',
  ];

  static const products = [
    Product(
      id: 'grabadora-voz-ai',
      name: 'Grabadora de voz AI',
      category: 'Tecnología',
      rating: 4.8,
      reviewCount: 273,
      recommendPercent: 88,
    ),
    Product(
      id: 'serum-vitamina-c',
      name: 'Sérum facial vitamina C',
      category: 'Belleza',
      rating: 4.2,
      reviewCount: 158,
      recommendPercent: 79,
    ),
    Product(
      id: 'cafetera-espresso-mini',
      name: 'Cafetera espresso mini',
      category: 'Hogar',
      rating: 4.5,
      reviewCount: 96,
      recommendPercent: 85,
    ),
    Product(
      id: 'audifonos-inalambricos-pro',
      name: 'Audífonos inalámbricos Pro',
      category: 'Tecnología',
      rating: 3.9,
      reviewCount: 412,
      recommendPercent: 68,
    ),
  ];

  static Product get featuredProduct => products.first;

  static const reviews = [
    Review(
      id: 'r1',
      productId: 'grabadora-voz-ai',
      author: 'Emily',
      verifiedBuyer: true,
      rating: 5,
      title: '100000/10 recommend!!',
      body:
          "I hadn't even had my recorder a week and I had used almost 300 minutes! "
          "With thousands of templates to choose from, it's extremely versatile...",
      date: 'Jul 13, 2026',
      recommended: true,
      likesCount: 2,
      hasPhoto: true,
    ),
    Review(
      id: 'r2',
      productId: 'grabadora-voz-ai',
      author: 'Carlos',
      verifiedBuyer: true,
      rating: 5,
      title: 'Batería increíble',
      body:
          'La batería dura toda la semana y la transcripción es sorprendentemente '
          'precisa, incluso en reuniones largas.',
      date: 'Ago 2, 2026',
      recommended: true,
      likesCount: 14,
      likedByMe: true,
    ),
    Review(
      id: 'r3',
      productId: 'grabadora-voz-ai',
      author: 'Lucía',
      verifiedBuyer: true,
      rating: 4,
      title: 'Cumple lo que promete',
      body:
          'Muy buena, aunque la app tarda un poco en sincronizar. Por lo demás, '
          'cumple todo lo que promete.',
      date: 'Jul 28, 2026',
      recommended: true,
      likesCount: 9,
    ),
    Review(
      id: 'r4',
      productId: 'grabadora-voz-ai',
      author: 'Diego',
      verifiedBuyer: false,
      rating: 3,
      title: 'Aceptable',
      body:
          'Funciona bien para clases, pero el micrófono capta mucho ruido de fondo '
          'en lugares abiertos.',
      date: 'Jul 20, 2026',
      likesCount: 4,
      hasPhoto: true,
    ),
    Review(
      id: 'r5',
      productId: 'grabadora-voz-ai',
      author: 'Valentina Rodríguez Castellanos',
      verifiedBuyer: true,
      rating: 2,
      title: 'Esperaba más de la app móvil',
      body:
          'El dispositivo es excelente, pero la aplicación se cierra al exportar '
          'transcripciones largas y el soporte tardó una semana en responder.',
      date: 'Jun 30, 2026',
      likesCount: 1,
    ),
  ];

  static List<Review> reviewsForProduct(String productId) =>
      reviews.where((r) => r.productId == productId).toList();

  static const currentUser = UserProfile(
    name: 'Emily Morales',
    username: 'emily',
    email: 'emily@correo.com',
    country: 'Colombia',
    bio: 'Me encanta probar gadgets y contar lo que realmente funciona.',
    memberSinceYear: 2024,
    reviewCount: 23,
    likesReceived: 142,
    averageRating: 4.3,
    followers: 12,
    following: 4,
  );

  static const myReviews = [
    Review(
      id: 'm1',
      productId: 'grabadora-voz-ai',
      author: 'Emily',
      verifiedBuyer: true,
      rating: 5,
      title: '100000/10 recommend!!',
      body: '',
      date: 'Jul 13, 2026',
      likesCount: 2,
    ),
    Review(
      id: 'm2',
      productId: 'cafetera-espresso-mini',
      author: 'Emily',
      verifiedBuyer: true,
      rating: 4,
      title: 'Café de verdad en la oficina',
      body: '',
      date: 'Jun 02, 2026',
      likesCount: 7,
      likedByMe: true,
    ),
    Review(
      id: 'm3',
      productId: 'serum-vitamina-c',
      author: 'Emily',
      verifiedBuyer: false,
      rating: 3,
      title: 'Borrador: falta probarlo un mes más',
      body: '',
      date: 'May 18, 2026',
      published: false,
    ),
  ];

  static String productName(String productId) => products
      .firstWhere((p) => p.id == productId, orElse: () => products.first)
      .name;
}
