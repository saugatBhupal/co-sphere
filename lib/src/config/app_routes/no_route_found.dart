import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class NoRouteFound extends StatelessWidget {
  const NoRouteFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text(AppStrings.noRoute)),
    );
  }
}
