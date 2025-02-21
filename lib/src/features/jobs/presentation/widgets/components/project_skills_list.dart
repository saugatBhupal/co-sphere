import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/button/skills_button.dart';
import 'package:flutter/material.dart';

class ProjectSkillsList extends StatelessWidget {
  final List<Skill> skills;

  const ProjectSkillsList({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...skills.map((skill) {
              String capitalizedSkillName = skill.name.isNotEmpty
                  ? skill.name[0].toUpperCase() + skill.name.substring(1)
                  : skill.name;
              return Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: SkillsButton(name: capitalizedSkillName),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
