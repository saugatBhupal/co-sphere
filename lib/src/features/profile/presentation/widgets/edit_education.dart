import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/dob_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/input_field.dart';
import 'package:cosphere/src/features/profile/data/dto/education/add_education_req_dto.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditEducation extends StatefulWidget {
  final String email;
  const EditEducation({super.key, required this.email});

  @override
  State<EditEducation> createState() => _EditEducationState();
}

class _EditEducationState extends State<EditEducation> {
  late final TextEditingController _organizationController;
  late final TextEditingController _degreeController;
  late final TextEditingController _fromController;
  late final TextEditingController _toController;

  @override
  void initState() {
    super.initState();
    _organizationController = TextEditingController();
    _degreeController = TextEditingController();
    _fromController = TextEditingController();
    _toController = TextEditingController();
  }

  @override
  void dispose() {
    _organizationController.dispose();
    _degreeController.dispose();
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _gap = SizedBox(height: 20);
    final _formKey = GlobalKey<FormState>();
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is AddEducationSuccess) {
          buildToast(
              toastType: ToastType.success,
              msg: "Education Added Successfully");
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
                textController: _organizationController,
                label: AppStrings.school,
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
                    child: DobField(
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
              DarkRoundedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<ProfileBloc>().add(AddEducation(
                          dto: AddEducationReqDto(
                            email: widget.email,
                            degree: _degreeController.text,
                            organization: _organizationController.text,
                            from: DateFormat('dd-MM-yyyy')
                                .parse(_fromController.text),
                            to: DateFormat('dd-MM-yyyy')
                                .parse(_toController.text),
                          ),
                        ));
                  }
                },
                title:
                    "${AppStrings.add} ${AppStrings.education} ${AppStrings.history}",
                height: context.height / 20,
                fontSize: 14,
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
