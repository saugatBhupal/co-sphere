import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/appbar/search_field_appbar.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/assigned_card.dart';
import 'package:flutter/material.dart';

class AssignedTaskScreen extends StatelessWidget {
  final AssignedTaskScreenArgs screenArgs;
  const AssignedTaskScreen({super.key, required this.screenArgs});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const SearchFieldAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.assigned,
                style: _textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: context.isTablet ? 18 : 14,
                ),
              ),
              SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: screenArgs.projects.length,
                  itemBuilder: (context, index) => AssignedCard(
                      project: screenArgs.projects[index],
                      uid: screenArgs.user.uid),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 4),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
