import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'dart:ui' as ui;

class AnimatedGlowBackground extends StatefulWidget {
  final Widget child;
  final Color glowColor;
  final Duration duration;

  const AnimatedGlowBackground({
    super.key,
    required this.child,
    this.glowColor = const Color.fromARGB(255, 126, 68, 226),
    this.duration = const Duration(seconds: 30),
  });

  @override
  State<AnimatedGlowBackground> createState() => _AnimatedGlowBackgroundState();
}

class _AnimatedGlowBackgroundState extends State<AnimatedGlowBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 181, 255),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _GlowPainter(
              progress: _controller.value,
              glowColor: widget.glowColor,
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _GlowPainter extends CustomPainter {
  final double progress;
  final Color glowColor;

  _GlowPainter({required this.progress, required this.glowColor});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final double radius = 100;

    final Rect rect = Rect.fromLTWH(8, 8, width - 10, height - 10);

    final RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    final Path path = Path()..addRRect(rRect);

    final ui.PathMetric metric = path.computeMetrics().first;

    final double pathLength = metric.length;
    final double distance1 = progress * pathLength;

    final double distance2 = ((progress + 0.5) % 1.0) * pathLength;

    _drawGlow(canvas, metric, distance1);

    _drawGlow(canvas, metric, distance2);
  }

  void _drawGlow(Canvas canvas, ui.PathMetric metric, double distance) {
    final ui.Tangent? tangent = metric.getTangentForOffset(distance);

    if (tangent == null) return;

    final Offset position = tangent.position;

    final Paint glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          glowColor.withOpacity(0.9),
          glowColor.withOpacity(0.35),
          glowColor.withOpacity(0.0),
        ],
      ).createShader(Rect.fromCircle(center: position, radius: 100));

    canvas.drawCircle(position, 100, glowPaint);
    
    final Paint centerPaint = Paint()
      ..color = glowColor.withOpacity(0.9)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    canvas.drawCircle(position, 8, centerPaint);
  }

  @override
  bool shouldRepaint(covariant _GlowPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.glowColor != glowColor;
  }
}
