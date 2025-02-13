import 'package:cosphere/src/features/project/presentation/widgets/card/members_card.dart';
import 'package:flutter/material.dart';

class MembersView extends StatelessWidget {
  const MembersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 13,
          itemBuilder: (context, index) => const MembersCard(),
          separatorBuilder: (context, index) {
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
