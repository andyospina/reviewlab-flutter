# ReviewLab · Flutter

Réplica visual en Flutter de 6 pantallas de la app Android **ReviewLab** (repositorio `Computacion-Movil`).
Solo interfaz: datos quemados y sin navegación entre pantallas.

| # | Pantalla | Archivo | Pantalla Android de referencia |
|---|----------|---------|--------------------------------|
| 1 | Login | `lib/screens/screen_1.dart` | `LoginScreen.kt` |
| 2 | Registro | `lib/screens/screen_2.dart` | `RegisterScreen.kt` |
| 3 | Inicio | `lib/screens/screen_3.dart` | `HomeScreen.kt` |
| 4 | Detalle de producto | `lib/screens/screen_4.dart` | `ProductDetailScreen.kt` |
| 5 | Perfil | `lib/screens/screen_5.dart` | `ProfileScreen.kt` |
| 6 | Lista de reseñas | `lib/screens/screen_6.dart` | `ReviewsListScreen.kt` |

Capturas de cada pantalla (360×640) en [`screenshots/`](screenshots/).

## Ejecutar

Requisitos: Flutter SDK reciente (el proyecto usa `package:material_ui`, como la plantilla *empty* de Flutter 3.47+ y Dart ≥ 3.14), un emulador Android o Chrome.

```bash
flutter pub get
flutter run                       # Pantalla 1 (Login)
flutter run --dart-define=SCREEN=3   # cualquier pantalla de 1 a 6
```

También se puede cambiar `kScreen` en `lib/main.dart`. No hay rutas: `main.dart` muestra la pantalla elegida.

## Estructura

```
lib/
├── main.dart                 # elige la pantalla (SCREEN=1..6)
├── theme/                    # colores (Color.kt) y tema claro
├── data/mock_data.dart       # productos, reseñas y usuario de ejemplo
├── screens/screen_1..6.dart
└── widgets/                  # reutilizables: custom_button, custom_text_field, custom_card,
                              # app_logo, app_top_bar, app_bottom_nav, star_rating, like_button,
                              # review_card, product_list_item, pill_chip, profile_avatar, auth_header
assets/images/                # avatar_emily.png, logo_reviewlab.png (registrados en pubspec.yaml)
test/                         # pruebas de las 6 pantallas
```

## Pruebas

```bash
flutter test
```

Cada pantalla se monta en 4 tamaños (320×480, 360×640, 411×891 y horizontal 800×360) con texto a 1×, 1.5× y 2×,
y se recorre el scroll: Flutter convierte cualquier `RenderFlex overflowed` en un fallo. Además se regeneran
las capturas de `screenshots/` (con Roboto del SDK si está disponible).

## Diferencias respecto a Android

- Perfil, Inicio y Lista de reseñas usan una sola lista con scroll; en Android esas pantallas tenían partes fijas
  que se desbordaban o aplastaban la lista en pantallas bajas (ya corregidas también allí).
- Las fotos de producto son el mismo recuadro gris de Android; el avatar usa `assets/images/avatar_emily.png`.
