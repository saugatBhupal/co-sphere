import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/widgets/appbar/search_field_appbar.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/tabbar/jobs_tabbar.dart';
import 'package:flutter/material.dart';

class UserJobScreen extends StatelessWidget {
  final UserJobsScreenArgs screenArgs;
  const UserJobScreen({super.key, required this.screenArgs});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const SearchFieldAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: JobsTabbar(
                    user: screenArgs.user, appliedJobs: screenArgs.jobs))
          ],
        ),
      ),
    );
  }
}
