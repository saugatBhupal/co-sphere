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
              color: color,
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          Container(
            width: double.infinity,
            height: completionRatio * 100,
            decoration: const BoxDecoration(
              color: Color(0xFFECE6E6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
