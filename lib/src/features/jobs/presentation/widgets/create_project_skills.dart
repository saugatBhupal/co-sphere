import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/input_field.dart';
import 'package:flutter/material.dart';

class CreateProjectSkills extends StatefulWidget {
  const CreateProjectSkills({super.key});

  @override
  State<CreateProjectSkills> createState() => _CreateProjectSkillsState();
}

class _CreateProjectSkillsState extends State<CreateProjectSkills> {
  @override
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

  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _formKey = GlobalKey<FormState>();
    List<String> skills = ["skill", "skill", "skill"];

    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(width: 0.6, color: AppColors.plaster),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (skills.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  ...List.generate(
                    skills.length,
                    (index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: const BoxDecoration(
                          color: AppColors.genie,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              skills[index],
                              style: _textTheme.bodySmall!.copyWith(
                                color: AppColors.midnight,
                                fontWeight: FontThickness.semiBold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "X",
                              style: _textTheme.bodyLarge!.copyWith(
                                color: AppColors.grey,
                                fontWeight: FontThickness.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          // const SizedBox(height: 10),
          Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: InputField(
                      textController: _skillController,
                      label: "",
                      hintText: "Skill Name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a skill name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    width: context.width / 4.8,
                    child: DarkRoundedButton(
                      onPressed: () {},
                      title: AppStrings.add,
                      fontSize: 13,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                    ),
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
