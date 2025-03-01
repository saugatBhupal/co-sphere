import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/utils/form_validator.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/dob_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/input_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/custom_dropdown.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/add_experience_req_dto.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditExperience extends StatefulWidget {
  final String email;
  const EditExperience({super.key, required this.email});

  @override
  State<EditExperience> createState() => _EditExperienceState();
}

class _EditExperienceState extends State<EditExperience> {
  late final TextEditingController _organizationController;
  late final TextEditingController _positionController;
  late final TextEditingController _fromController;
  late final TextEditingController _toController;
  late final TextEditingController _postController;

  @override
  void initState() {
    super.initState();
    _organizationController = TextEditingController();
    _positionController = TextEditingController();
    _fromController = TextEditingController();
    _toController = TextEditingController();
    _postController = TextEditingController();
  }

  @override
  void dispose() {
    _organizationController.dispose();
    _positionController.dispose();
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
    final _formKey = GlobalKey<FormState>();
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is AddExperienceSuccess) {
          buildToast(
              toastType: ToastType.success,
              msg: "Experience Added Successfully");
          Navigator.of(context).pop();
        }
        if (state is GetProfileInfoFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
      },
      child: Container(
        width: context.width,
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 0.4, color: AppColors.plaster),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputField(
                textController: _positionController,
                label: "${AppStrings.degree}/${AppStrings.qualification}",
              ),
              _gap,
              InputField(
                textController: _organizationController,
                label: AppStrings.company,
              ),
              _gap,
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: DobField(
                      validator: (val) {
                        return FormValidator.validateDOB(val);
                      },
                      dobController: _fromController,
                      labelText: AppStrings.from,
                      hintText: "dd-mm-yyyy",
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    flex: 1,
                    child: DobField(
                      dobController: _toController,
                      labelText: AppStrings.to,
                      hintText: "dd-mm-yyyy",
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<ProfileBloc>().add(AddExperience(
                          dto: AddExperienceReqDto(
                            email: widget.email,
                            position: _positionController.text,
                            organization: _organizationController.text,
                            status: selectedValue!,
                            from: DateFormat('dd-MM-yyyy')
                                .parse(_fromController.text),
                            to: _toController.text.isNotEmpty
                                ? DateFormat('dd-MM-yyyy')
                                    .parse(_toController.text)
                                : null,
                          ),
                        ));
                  }
                },
                title:
                    "${AppStrings.add} ${AppStrings.experience} ${AppStrings.history}",
                height: context.height / 20,
                fontSize: context.isTablet ? 18 : 14,
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
