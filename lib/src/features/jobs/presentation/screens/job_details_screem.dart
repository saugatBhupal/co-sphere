import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/job_details_header.dart';
import 'package:flutter/material.dart';

class JobDetailsScreem extends StatelessWidget {
  const JobDetailsScreem({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return const Scaffold(
      appBar: CommonAppbar(title: AppStrings.jobDetails),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: JobDetailsHeader(),
      ),
    );
  }
}
