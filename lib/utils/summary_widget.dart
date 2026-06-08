
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({
    super.key,
    required this.title,
    required this.count,
    required this.total,
    required this.baseColor,
  });

  final String title;
  final int count;
  final int total;
  final MaterialColor baseColor;

  @override
  Widget build(BuildContext context) {
    final ratio = total > 0 ? count / total : 0.0;

    final percentage = (ratio * 100).toStringAsFixed(0);

    final dynamicColor =
        Color.lerp(baseColor.shade100, baseColor.shade700, ratio) ?? baseColor;

    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        Stack(
          alignment: Alignment.center,
          children: [
           
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: 1.0,
                strokeWidth: 12,
                valueColor: AlwaysStoppedAnimation<Color>(
                  baseColor.shade100.withOpacity(0.3),
                ),
              ),
            ),

            SizedBox(
              width: 100,
              height: 100,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: ratio),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return CircularProgressIndicator(
                    value: value,
                    strokeWidth: 10,
                    strokeCap: StrokeCap.round,
                    valueColor: AlwaysStoppedAnimation<Color>(dynamicColor),
                  );
                },
              ),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$count/$total',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '($percentage%)',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
