import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void addReviewDialog({
  required BuildContext context,
  required Widget child,
  bool barrierDismissible = true,
  double borderRadius = 12.0,
  required ProjectBloc projectBloc,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return BlocProvider<ProjectBloc>.value(
        value: projectBloc,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: double.infinity),
            child: SingleChildScrollView(
              child: child,
            ),
          ),
        ),
      );
    },
  );
}
