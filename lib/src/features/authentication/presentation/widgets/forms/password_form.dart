import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/utils/form_validator.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/password_field.dart';
import 'package:cosphere/src/features/authentication/data/dto/create_password/create_password_request_dto.dart';
import 'package:cosphere/src/features/authentication/presentation/viewmodels/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordForm extends StatefulWidget {
  final String email;
  const PasswordForm({super.key, required this.email});

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is CreatePasswordError) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is CreatePasswordSuccess) {
          buildToast(toastType: ToastType.success, msg: state.message);
          Navigator.of(context).pushNamed(
            AppRoutes.interest,
            // arguments: state.user.userInfo.email,
          );
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //   AppRoutes.signin,
          //   (route) => false,
          //   // arguments: state.user.userInfo.email,
          // );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PasswordField(
                passwordController: _passwordController,
                label: AppStrings.password,
                icon: AppIcons.user,
                validator: (val) => FormValidator.validatePassword(val),
              ),
              const SizedBox(height: 30),
              PasswordField(
                passwordController: _confirmController,
                label: "${AppStrings.confirm} ${AppStrings.password}",
                icon: AppIcons.user,
                validator: (val) => FormValidator.validateConfirmPassword(
                    val, _passwordController.text),
              ),
              const SizedBox(height: 40),
              DarkRoundedButton(
                  title: AppStrings.continueBtn,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<SignUpBloc>().add(CreatePassword(
                          dto: CreatePasswordRequestDto(
                              email: widget.email,
                              password: _confirmController.text)));
                    }
                  }),
            ],
          ),
        );
      },
    );
  }
}
