import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/cards/experience_card.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/input_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/location_dropdown.dart';
import 'package:flutter/material.dart';

class EditExperience extends StatefulWidget {
  const EditExperience({super.key});

  @override
  State<EditExperience> createState() => _EditExperienceState();
}

class _EditExperienceState extends State<EditExperience> {
  late final TextEditingController _organizationController;
  late final TextEditingController _degreeController;
  late final TextEditingController _fromController;
  late final TextEditingController _toController;
  late final TextEditingController _postController;

  @override
  void initState() {
    super.initState();
    _organizationController = TextEditingController();
    _degreeController = TextEditingController();
    _fromController = TextEditingController();
    _toController = TextEditingController();
    _postController = TextEditingController();
  }

  @override
  void dispose() {
    _organizationController.dispose();
    _degreeController.dispose();
    _fromController.dispose();
    _toController.dispose();
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> posts = ["Intern", "Associate", "Junior", "Mid", "Senior"];
    String? selectedValue = posts[0];
    final _gap = SizedBox(height: 20);
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(width: 0.4, color: AppColors.plaster),
      ),
      child: Column(
        children: [
          InputField(
            textController: _organizationController,
            label: AppStrings.company,
          ),
          _gap,
          InputField(
            textController: _degreeController,
            label: "${AppStrings.degree}/${AppStrings.qualification}",
          ),
          _gap,
          Row(
            children: [
              Flexible(
                flex: 1,
                child: InputField(
                  textController: _fromController,
                  label: AppStrings.from,
                  hintText: "2022",
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                flex: 1,
                child: InputField(
                  textController: _toController,
                  label: AppStrings.to,
                  hintText: "2023",
                ),
              ),
            ],
          ),
          _gap,
          CustomDropdown(
            label: AppStrings.post,
            items: posts,
            onChanged: (value) {
              selectedValue = value;
            },
          ),
          _gap,
          DarkRoundedButton(
            title:
                "${AppStrings.add} ${AppStrings.experience} ${AppStrings.history}",
            height: context.height / 20,
            fontSize: 14,
            padding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ],
      ),
    );
  }
}
