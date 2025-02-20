import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/search/presentation/viewmodels/search_bloc.dart';
import 'package:cosphere/src/features/search/presentation/widgets/cards/jobs_search_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobsSearch extends StatelessWidget {
  final String query;
  const JobsSearch({
    super.key,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => sl<SearchBloc>()..add(GetJobByName(query: query)),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchHistoryFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
          }
          if (state is GetJobByNameSuccess) {
            if (state.jobs.isEmpty) {
              return Center(
                child: Text(
                  "No Job Name $query",
                  style: _textTheme.bodyMedium!.copyWith(color: AppColors.grey),
                ),
              );
            } else {
              return SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.jobs.length,
                  itemBuilder: (context, index) =>
                      JobsSearchCard(job: state.jobs[index]),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                ),
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}
