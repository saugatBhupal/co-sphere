import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/input_field.dart';
import 'package:flutter/material.dart';

class CreateProjectSkills extends StatefulWidget {
  final List<String> skills;
  final Function(String) onSkillAdded;

  const CreateProjectSkills({
    super.key,
    required this.skills,
    required this.onSkillAdded,
  });

  @override
  State<CreateProjectSkills> createState() => _CreateProjectSkillsState();
}

class _CreateProjectSkillsState extends State<CreateProjectSkills> {
  late final TextEditingController _skillController;

  @override
  void initState() {
    super.initState();
    _skillController = TextEditingController();
  }

  @override
  void dispose() {
    _skillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.plaster, width: 0.6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.skills.isNotEmpty)
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: widget.skills
                  .map(
                    (skill) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.genie,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        skill,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.midnight,
                              fontWeight: FontThickness.semiBold,
                            ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          Form(
            child: Row(
              children: [
                Expanded(
                  child: InputField(
                    textController: _skillController,
                    label: "",
                    hintText: "Skill Name",
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: DarkRoundedButton(
                    onPressed: () {
                      final skill = _skillController.text.trim();
                      if (skill.isNotEmpty) {
                        widget.onSkillAdded(skill);
                        _skillController.clear();
                      }
                    },
                    title: AppStrings.add,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
