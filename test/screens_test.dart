import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reviewlab_flutter/main.dart';

import 'helpers/test_env.dart';

/// Cada pantalla se monta en varios tamaños y con texto grande. Flutter convierte un desbordamiento
/// (RenderFlex overflowed) en una excepción, así que si algo no cabe la prueba falla.
void main() {
  setUpAll(loadRealFonts);

  const names = {
    1: 'screen_1_login',
    2: 'screen_2_register',
    3: 'screen_3_home',
    4: 'screen_4_product_detail',
    5: 'screen_5_profile',
    6: 'screen_6_reviews_list',
  };

  for (final entry in names.entries) {
    group('Pantalla ${entry.key} (${entry.value})', () {
      for (final device in kDevices.entries) {
        for (final scale in [1.0, 1.5, 2.0]) {
          testWidgets('sin desbordes en ${device.key} con texto x$scale', (
            tester,
          ) async {
            useDevice(tester, device.value, textScale: scale);
            final boundary = GlobalKey();
            await tester.pumpWidget(app(screenFor(entry.key), boundary));
            await tester.pumpAndSettle();

            expect(tester.takeException(), isNull);
            expect(find.byType(Scaffold), findsOneWidget);

            // Recorre el scroll de arriba abajo: lo que está fuera de la vista también se construye y mide.
            final scrollables = find.byType(Scrollable);
            if (scrollables.evaluate().isNotEmpty) {
              await tester.drag(scrollables.first, const Offset(0, -3000));
              await tester.pumpAndSettle();
              expect(tester.takeException(), isNull);
            }
          });
        }
      }

      testWidgets('captura 360x640', (tester) async {
        useDevice(tester, kDevices['tipico_360x640']!);
        final boundary = GlobalKey();
        await tester.pumpWidget(app(screenFor(entry.key), boundary));
        await tester.pumpAndSettle();
        await savePng(tester, boundary, entry.value);
      });
    });
  }

  testWidgets(
    'main.dart elige la pantalla por número y cae en Login si no existe',
    (tester) async {
      await tester.pumpWidget(const ReviewLabApp(screen: 99));
      expect(find.text('Iniciar Sesión'), findsOneWidget);
    },
  );
}
