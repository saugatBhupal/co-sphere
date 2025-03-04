import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/project_application_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveApplicationView extends StatelessWidget {
  final String uid;
  const ActiveApplicationView({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        final acceptedProjects = context.watch<ProjectBloc>().acceptedProjects;
        if (acceptedProjects.isEmpty) {
          return const Center(child: Text("No active projects found"));
        }

        return SizedBox(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: acceptedProjects.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.active,
                    arguments: ActiveScreensArgs(
                        projectId: acceptedProjects[index].id, userId: uid)),
                child:
                    ProjectApplicationCard(project: acceptedProjects[index])),
            separatorBuilder: (context, index) => const SizedBox(height: 4),
          ),
        );
      },
    );
  }
}
