import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showEditDialog({
  required BuildContext context,
  required Widget child,
  bool barrierDismissible = true,
  double borderRadius = 12.0,
  required ProfileBloc profileBloc,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return BlocProvider<ProfileBloc>.value(
        value: profileBloc,
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
