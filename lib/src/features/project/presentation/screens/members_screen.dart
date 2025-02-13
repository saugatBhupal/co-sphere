import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/members_card.dart';
import 'package:flutter/material.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(title: AppStrings.members),
      body: ListView.separated(
        itemCount: 8,
        itemBuilder: (context, index) => const MembersCard(),
        separatorBuilder: (context, index) => const SizedBox(),
      ),
    );
  }
}
