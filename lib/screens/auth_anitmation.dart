import 'dart:math';
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';
import 'package:maintenance_app/config/palette.dart';

class BackgroundPainter extends CustomPainter {
  BackgroundPainter({Animation<double> animation})
      : yellow = Paint()
          ..color = Palette.Yellow
          ..style = PaintingStyle.fill,
        darkGrey = Paint()
          ..color = Palette.DarkGrey
          ..style = PaintingStyle.fill,
        mediumGrey = Paint()
          ..color = Palette.MediumGrey
          ..style = PaintingStyle.fill,
        lightGrey = Paint()
          ..color = Palette.LightGrey
          ..style = PaintingStyle.fill,
        liquidAnim = CurvedAnimation(
          parent: animation,
          curve: Curves.elasticOut,
          reverseCurve: Curves.easeInBack,
        ),
        yellowAnim = CurvedAnimation(
          parent: animation,
          curve: const SpringCurve(),
          reverseCurve: Curves.easeInCirc,
        ),
        darkGreyAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            0.7,
            curve: Interval(0, 0.8, curve: SpringCurve()),
          ),
          reverseCurve: Curves.linear,
        ),
        mediumGreyAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            0.8,
            curve: Interval(0, 0.9, curve: SpringCurve()),
          ),
          reverseCurve: Curves.linear,
        ),
        lightGreyAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            0.9,
            curve: Interval(0, 1, curve: SpringCurve()),
          ),
          reverseCurve: Curves.linear,
        ),
        super(repaint: animation);

  final Animation<double> liquidAnim;
  final Animation<double> yellowAnim;
  final Animation<double> darkGreyAnim;
  final Animation<double> mediumGreyAnim;
  final Animation<double> lightGreyAnim;

  final Paint yellow;
  final Paint darkGrey;
  final Paint mediumGrey;
  final Paint lightGrey;

  @override
  void paint(Canvas canvas, Size size) {
    paintYellow(size, canvas);
    paintDarkGrey(size, canvas);
    paintLightGrey(size, canvas);
  }

  void paintYellow(Size size, Canvas canvas) {
    final path = Path();
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, lerpDouble(0, size.height, yellowAnim.value));
    _addPointsToPath(path, [
      Point(
        lerpDouble(0, size.width / 3, yellowAnim.value),
        lerpDouble(0, size.height, yellowAnim.value),
      ),
      Point(
        lerpDouble(size.width / 2, size.width / 4 * 3, liquidAnim.value),
        lerpDouble(size.height / 2, size.height / 4 * 3, liquidAnim.value),
      ),
      Point(
        size.width,
        lerpDouble(size.height / 2, size.height * 3 / 4, liquidAnim.value),
      ),
    ]);

    canvas.drawPath(path, yellow);
  }

  void paintDarkGrey(Size size, Canvas canvas) {
    final path = Path();
    path.moveTo(size.width, 300);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(
        size.height / 4,
        size.height / 2,
        darkGreyAnim.value,
      ),
    );
    _addPointsToPath(
      path,
      [
        Point(
          size.width / 4,
          lerpDouble(size.height / 2, size.height * 3 / 4, liquidAnim.value),
        ),
        Point(
          size.width * 3 / 5,
          lerpDouble(size.height / 4, size.height / 2, liquidAnim.value),
        ),
        Point(
          size.width * 4 / 5,
          lerpDouble(size.height / 6, size.height / 3, darkGreyAnim.value),
        ),
        Point(
          size.width,
          lerpDouble(size.height / 5, size.height / 4, darkGreyAnim.value),
        ),
      ],
    );

    canvas.drawPath(path, darkGrey);
  }

  void paintLightGrey(Size size, Canvas canvas) {
    if (lightGreyAnim.value > 0) {
      final path = Path();

      path.moveTo(size.width * 3 / 4, 0);
      path.lineTo(0, 0);
      path.lineTo(
        0,
        lerpDouble(0, size.height / 12, lightGreyAnim.value),
      );

      _addPointsToPath(path, [
        Point(
          size.width / 7,
          lerpDouble(0, size.height / 6, liquidAnim.value),
        ),
        Point(
          size.width / 3,
          lerpDouble(0, size.height / 10, liquidAnim.value),
        ),
        Point(
          size.width / 3 * 2,
          lerpDouble(0, size.height / 8, liquidAnim.value),
        ),
        Point(
          size.width * 3 / 4,
          0,
        ),
      ]);

      canvas.drawPath(path, lightGrey);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _addPointsToPath(Path path, List<Point> points) {
    if (points.length < 3) {
      throw UnsupportedError(' Need three or more points to create a path.');
    }

    for (var i = 0; i < points.length - 2; i++) {
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }

    path.quadraticBezierTo(
        points[points.length - 2].x,
        points[points.length - 2].y,
        points[points.length - 1].x,
        points[points.length - 1].y);
  }
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}

class SpringCurve extends Curve {
  const SpringCurve({
    this.a = 0.15,
    this.w = 19.4,
  });

  final double a;
  final double w;

  @override
  double transformInternal(double t) {
    return (-(pow(e, -t / a) * cos(t * w)) + 1).toDouble();
  }
}
