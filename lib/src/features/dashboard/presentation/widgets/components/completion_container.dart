import 'package:flutter/material.dart';

class CompletionContainer extends StatelessWidget {
  final int total;
  final int completed;
  final Color color;

  const CompletionContainer({
    super.key,
    required this.total,
    required this.completed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double completionRatio = completed / total;
    print("Completion Ratio: $completionRatio");

    return Container(
      width: 32,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFECE6E6),
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: completionRatio > 0.7 && completionRatio < 1.0
                  ? completionRatio * 100 - 30
                  : completionRatio * 100,
              decoration: BoxDecoration(
                color: color, // Completed color
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(32),
                  bottomRight: const Radius.circular(32),
                  topLeft: completionRatio == 1.0
                      ? const Radius.circular(32)
                      : Radius.zero,
                  topRight: completionRatio == 1.0
                      ? const Radius.circular(32)
                      : Radius.zero,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
