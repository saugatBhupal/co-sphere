import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';

import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/textspan_field.dart';
import 'package:cosphere/src/features/profile/data/dto/intro/update_intro_req_dto.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditIntro extends StatefulWidget {
  final String about;
  final String overview;
  const EditIntro({super.key, required this.about, required this.overview});

  @override
  State<EditIntro> createState() => _EditIntroState();
}

class _EditIntroState extends State<EditIntro> {
  late final TextEditingController _aboutController;
  late final TextEditingController _overviewController;

  @override
  void initState() {
    super.initState();
    _aboutController = TextEditingController(text: widget.about);
    _overviewController = TextEditingController(text: widget.overview);
  }

  @override
  void dispose() {
    _aboutController.dispose();
    _overviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const _gap = SizedBox(height: 20);
    final _formKey = GlobalKey<FormState>();
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is UpdateIntroSuccess) {
          buildToast(toastType: ToastType.success, msg: "Intro updated");
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
              TextspanField(
                textController: _aboutController,
                label: AppStrings.about,
              ),
              _gap,
              TextspanField(
                textController: _overviewController,
                label: "${AppStrings.professional} ${AppStrings.overview}",
              ),
              _gap,
              DarkRoundedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String? about = _aboutController.text.isNotEmpty
                        ? _aboutController.text
                        : null;
                    String? overview = _overviewController.text.isNotEmpty
                        ? _overviewController.text
                        : null;

                    context.read<ProfileBloc>().add(UpdateIntro(
                          dto: UpdateIntroReqDto(
                            email: "msarina823@gmail.com",
                            about: _aboutController.text.isNotEmpty
                                ? _aboutController.text
                                : null,
                            overview: _overviewController.text.isNotEmpty
                                ? _overviewController.text
                                : null,
                          ),
                        ));
                  }
                },
                title: AppStrings.save,
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
