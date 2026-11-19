import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reviewlab_flutter/theme/app_theme.dart';

/// Tamaños de teléfono (dp) con los que se prueba cada pantalla.
const Map<String, Size> kDevices = {
  'pequeno_320x480': Size(320, 480),
  'tipico_360x640': Size(360, 640),
  'grande_411x891': Size(411, 891),
  'horizontal_800x360': Size(800, 360),
};

/// Carga Roboto y los íconos de Material desde el SDK de Flutter, para que las capturas se vean como en
/// un teléfono (en pruebas, Flutter usa por defecto una fuente de cuadrados). Si el SDK no los trae, se omite.
Future<void> loadRealFonts() async {
  final root = Platform.environment['FLUTTER_ROOT'];
  if (root == null) return;
  final dir = '$root/bin/cache/artifacts/material_fonts';
  Future<ByteData> bytes(String name) async {
    final data = await File('$dir/$name').readAsBytes();
    return ByteData.sublistView(Uint8List.fromList(data));
  }

  if (!Directory(dir).existsSync()) return;
  final roboto = FontLoader('Roboto');
  for (final f in ['Regular', 'Medium', 'Bold', 'Black', 'Light']) {
    final file = File('$dir/Roboto-$f.ttf');
    if (file.existsSync()) roboto.addFont(bytes('Roboto-$f.ttf'));
  }
  await roboto.load();
  // Roboto no trae ★/☆; en un teléfono Android los pone la fuente del sistema, aquí DejaVu si existe.
  const dejavu = '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf';
  if (File(dejavu).existsSync()) {
    final fallback = FontLoader('SymbolsFallback')
      ..addFont(
        Future.value(ByteData.sublistView(File(dejavu).readAsBytesSync())),
      );
    await fallback.load();
  }
  final icons = FontLoader('MaterialIcons')
    ..addFont(bytes('MaterialIcons-Regular.otf'));
  await icons.load();
}

/// Envuelve [screen] en un MaterialApp con el tema de la app y un [RepaintBoundary] para capturarla.
Widget app(Widget screen, GlobalKey boundary) => MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: AppTheme.light.copyWith(
    textTheme: AppTheme.light.textTheme.apply(
      fontFamily: 'Roboto',
      fontFamilyFallback: ['SymbolsFallback'],
    ),
  ),
  home: RepaintBoundary(key: boundary, child: screen),
);

/// Ajusta la ventana de la prueba al tamaño de [device] (en dp) y a una escala de texto.
void useDevice(WidgetTester tester, Size device, {double textScale = 1.0}) {
  tester.view.physicalSize = device;
  tester.view.devicePixelRatio = 1.0;
  tester.platformDispatcher.textScaleFactorTestValue = textScale;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
    tester.platformDispatcher.clearTextScaleFactorTestValue();
  });
}

/// Guarda una captura PNG del [boundary] (2x) en `screenshots/`.
Future<void> savePng(
  WidgetTester tester,
  GlobalKey boundary,
  String name,
) async {
  await tester.runAsync(() async {
    final render =
        boundary.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final image = await render.toImage(pixelRatio: 2);
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    final file = File('screenshots/$name.png')..createSync(recursive: true);
    await file.writeAsBytes(data!.buffer.asUint8List());
  });
}
