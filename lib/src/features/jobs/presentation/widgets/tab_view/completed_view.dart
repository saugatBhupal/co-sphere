import 'package:flutter/material.dart';

class CompletedView extends StatelessWidget {
  const CompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) => const CompletedView(),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 4);
        },
      ),
    );
  }
}
