import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/members_card.dart';
import 'package:flutter/material.dart';

class MembersView extends StatelessWidget {
  final List<User> members;
  const MembersView({
    Key? key,
    required this.members,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: members.length,
      itemBuilder: (context, index) => MembersCard(member: members[index]),
      separatorBuilder: (context, index) => const SizedBox(),
    );
  }
}
