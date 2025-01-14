import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/widgets/input_fields/input_field.dart';
import 'package:flutter/material.dart';

class EditSkills extends StatefulWidget {
  const EditSkills({super.key});

  @override
  State<EditSkills> createState() => _EditSkillsState();
}

class _EditSkillsState extends State<EditSkills> {
  late final TextEditingController _skillNameController;

  @override
  void initState() {
    super.initState();
    _skillNameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _skillNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(width: 0.6, color: AppColors.plaster),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              ...List.generate(
                5,
                (index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: const BoxDecoration(
                      color: AppColors.genie,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Node JS",
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
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: InputField(
                    textController: _skillNameController,
                    label: "",
                    hintText: "Skill Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  width: context.width / 4.8,
                  child: const DarkRoundedButton(
                    title: AppStrings.add,
                    fontSize: 13,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
