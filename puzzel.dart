import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JK',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('JK'),
          backgroundColor: Colors.grey[850],
        ),
        body: Stack(
          children: [
            Center(child: CrypticSymbol()),
            Positioned(
              top: 20,
              right: 20,
              child: SmallRainbow(),
            ),
          ],
        ),
      ),
    );
  }
}

class CrypticSymbol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 300),
      painter: SymbolPainter(),
    );
  }
}

class SymbolPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    // Draw the triangle
    var trianglePath = Path();
    trianglePath.moveTo(size.width / 2, 0);
    trianglePath.lineTo(0, size.height);
    trianglePath.lineTo(size.width, size.height);
    trianglePath.close();
    canvas.drawPath(trianglePath, paint);

    // Draw the circle
    canvas.drawCircle(Offset(size.width / 2, size.height / 1.5), 60, paint);

    // Draw the vertical line (the inner line of the symbol)
    paint.strokeWidth = 5;
    paint.color = Colors.white;
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SmallRainbow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(50, 30),
      painter: RainbowPainter(),
    );
  }
}

class RainbowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;

    // Draw small rainbow arcs
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];

    double arcHeight = size.height / 2;
    for (int i = 0; i < colors.length; i++) {
      paint.color = colors[i];
      canvas.drawArc(
        Rect.fromLTWH(0, arcHeight - (i * 3), size.width, size.height),
        0,
        3.14,
        true,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
