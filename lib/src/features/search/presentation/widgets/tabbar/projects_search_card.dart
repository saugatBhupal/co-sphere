import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/search/presentation/viewmodels/search_bloc.dart';
import 'package:cosphere/src/features/search/presentation/widgets/cards/project_search_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsSearch extends StatelessWidget {
  final String query;
  final String uid;
  const ProjectsSearch({
    super.key,
    required this.query,
    required this.uid,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) =>
          sl<SearchBloc>()..add(GetProjectByName(query: query)),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchHistoryFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
          }
          if (state is GetProjectByNameSuccess) {
            if (state.projects.isEmpty) {
              return Center(
                child: Text(
                  "No Project Name $query",
                  style: _textTheme.bodyMedium!.copyWith(color: AppColors.grey),
                ),
              );
            } else {
              return SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: state.projects.length,
                  itemBuilder: (context, index) => ProjectSearchCard(
                      project: state.projects[index], uid: uid),
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
