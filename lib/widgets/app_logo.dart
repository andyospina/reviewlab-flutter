import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Marca "R" de ReviewLab: burbuja redondeada (esquina inferior izquierda recta) con cola triangular.
/// Mismas proporciones que `AppLogo.kt` (lienzo de 84, burbuja de 76x68, radio 20).
class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size = 84,
    this.bubbleColor = AppColors.electricLime,
    this.markColor = AppColors.ink,
  });

  final double size;
  final Color bubbleColor;
  final Color markColor;

  static const double _mark = 84;
  static const double _bubbleW = 76;
  static const double _bubbleH = 68;

  @override
  Widget build(BuildContext context) {
    final scale = size / _mark;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          CustomPaint(
            size: Size.square(size),
            painter: _LogoPainter(scale, bubbleColor),
          ),
          SizedBox(
            width: _bubbleW * scale,
            height: _bubbleH * scale,
            child: Center(
              child: Text(
                'R',
                style: TextStyle(
                  color: markColor,
                  fontWeight: FontWeight.w900,
                  fontSize: size * 0.42,
                  height: 1,
                  letterSpacing: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoPainter extends CustomPainter {
  _LogoPainter(this.scale, this.color);

  final double scale;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final radius = Radius.circular(20 * scale);
    canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        0,
        0,
        76 * scale,
        68 * scale,
        topLeft: radius,
        topRight: radius,
        bottomRight: radius,
        bottomLeft: Radius.zero,
      ),
      paint,
    );
    final tail = Path()
      ..moveTo(0, 66 * scale)
      ..lineTo(18 * scale, 66 * scale)
      ..lineTo(0, 82 * scale)
      ..close();
    canvas.drawPath(tail, paint);
  }

  @override
  bool shouldRepaint(_LogoPainter old) =>
      old.scale != scale || old.color != color;
}
