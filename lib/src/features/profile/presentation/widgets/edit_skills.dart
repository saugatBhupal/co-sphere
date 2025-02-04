import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/input_field.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_skill_usecase.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';

class EditSkills extends StatefulWidget {
  final String uid;
  final List<Skill>? skills;
  const EditSkills({
    Key? key,
    required this.uid,
    this.skills,
  }) : super(key: key);

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
    final _formKey = GlobalKey<FormState>();
    final _textTheme = Theme.of(context).textTheme;
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is AddSkillSuccess) {
          buildToast(
              toastType: ToastType.success, msg: "Skill Added Successfully");
          Navigator.of(context).pop();
        }
        if (state is AddSkillFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
      },
      child: Container(
        width: context.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                  widget.skills!.length ?? 0,
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
                            widget.skills![index].name,
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
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: InputField(
                        textController: _skillNameController,
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<ProfileBloc>().add(AddSkill(
                                params: AddSkillsParams(
                                    uid: widget.uid,
                                    name: _skillNameController.text)));
                          }
                        },
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
      ),
    );
  }
}
