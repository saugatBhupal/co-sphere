import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/widgets/appbar/search_field_appbar.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/created_project_tabbar.dart';
import 'package:flutter/material.dart';

class CreatedProjectsScreen extends StatelessWidget {
  final User user;
  const CreatedProjectsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const SearchFieldAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.created,
              style:
                  _textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
            Expanded(child: CreatedProjectTabbar(user: user))
          ],
        ),
      ),
    );
  }
}
