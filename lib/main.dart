import 'package:material_ui/material_ui.dart';

import 'screens/screen_1.dart';
import 'screens/screen_2.dart';
import 'screens/screen_3.dart';
import 'screens/screen_4.dart';
import 'screens/screen_5.dart';
import 'screens/screen_6.dart';
import 'theme/app_theme.dart';

/// Pantalla que se muestra (1 a 6). No hay navegación entre pantallas: para probar otra, cambia
/// [kScreen] o ejecuta `flutter run --dart-define=SCREEN=3`.
const int kScreen = int.fromEnvironment('SCREEN', defaultValue: 1);

void main() {
  runApp(const ReviewLabApp());
}

Widget screenFor(int number) {
  switch (number) {
    case 2:
      return const Screen2();
    case 3:
      return const Screen3();
    case 4:
      return const Screen4();
    case 5:
      return const Screen5();
    case 6:
      return const Screen6();
    case 1:
    default:
      return const Screen1();
  }
}

class ReviewLabApp extends StatelessWidget {
  const ReviewLabApp({super.key, this.screen = kScreen});

  final int screen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReviewLab',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: screenFor(screen),
    );
  }
}
