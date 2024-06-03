import 'dart:math';

import 'package:flutter/material.dart';

class OtherStatus extends StatelessWidget {
  const OtherStatus(
      {super.key,
      required this.name,
      required this.time,
      required this.isSeen,
      required this.statusNum});
  final String name;
  final String time;
  final bool isSeen;
  final int statusNum;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomPaint(
        painter: StatusPainter(isSeen, statusNum),
        child: const CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 25,
        ),
      ),
      title: const Text(
        "Random Guy",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        "Today at, $time",
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey),
      ),
    );
  }
}

double degreeToRadian(double angle) {
  return angle * pi / 180;
}

class StatusPainter extends CustomPainter {
  bool isSeen;
  int statusNum;
  StatusPainter(this.isSeen, this.statusNum);
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 6.5
      ..color = isSeen ? Colors.grey : Colors.teal
      ..style = PaintingStyle.stroke;
    drawArc(canvas, size, paint);
  }

  void drawArc(Canvas canvas, Size size, Paint paint) {
    if (statusNum == 1) {
      canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeToRadian(0), degreeToRadian(360), false, paint);
    } else {
      double degree = -90;
      double arc = 360 / statusNum;
      for (int i = 0; i < statusNum; i++) {
        canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            degreeToRadian(degree + 4), degreeToRadian(arc - 8), false, paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
