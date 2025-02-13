import 'package:cosphere/src/features/profile/presentation/widgets/button/skills_button.dart';
import 'package:flutter/material.dart';

class ProjectSkillsList extends StatelessWidget {
  const ProjectSkillsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> skills = [
      "Mobile Development",
      "React JS",
      "Node JS",
      "Mongo DB",
      "Mobile Development",
      "React JS",
      "Node JS",
      "Mongo DB",
    ];
    return SizedBox(
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...skills.map((skill) => Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: SkillsButton(name: skill),
                )),
          ],
        ),
      ),
    );
  }
}
