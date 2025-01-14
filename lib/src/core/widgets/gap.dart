import 'package:flutter/material.dart';

class SizedBox extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  const SizedBox({
    Key? key,
    this.height = 20,
    this.width = 5,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
}
