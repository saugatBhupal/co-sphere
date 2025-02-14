import 'package:flutter/material.dart';

void addTaskDialog({
  required BuildContext context,
  required Widget child,
  bool barrierDismissible = true,
  double borderRadius = 12.0,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: double.infinity),
          child: SingleChildScrollView(
            child: child,
          ),
        ),
      );
    },
  );
}
