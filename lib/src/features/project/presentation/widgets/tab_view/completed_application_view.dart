import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/project_application_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedApplicationView extends StatelessWidget {
  final String uid;
  const CompletedApplicationView({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        final completedProject = context.watch<ProjectBloc>().completedProjects;
        if (completedProject.isEmpty) {
          return const Center(child: Text("No projects found"));
        }
        return SizedBox(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: completedProject.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                    AppRoutes.completed,
                    arguments: completedProject[index].id),
                child:
                    ProjectApplicationCard(project: completedProject[index])),
            separatorBuilder: (context, index) => const SizedBox(height: 4),
          ),
        );
      },
    );
  }
}
