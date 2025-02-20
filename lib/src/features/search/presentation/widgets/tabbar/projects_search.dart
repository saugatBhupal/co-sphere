import 'package:cosphere/src/features/search/presentation/widgets/cards/jobs_search_card.dart';
import 'package:flutter/widgets.dart';

class ProjectsSearch extends StatelessWidget {
  const ProjectsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) => const JobsSearchCard(),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 4);
        },
      ),
    );
  }
}
