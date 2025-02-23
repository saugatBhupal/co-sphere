import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/authentication/data/dto/otp/otp_request_dto.dart';
import 'package:cosphere/src/features/authentication/presentation/viewmodels/bloc/sign_up_bloc.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/textspan/account_textspan.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/otp_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpForm extends StatefulWidget {
  final String email;
  const OtpForm({super.key, required this.email});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());
  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is VerifyOtpError) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is VerifyOtpSuccess) {
          buildToast(
            toastType: ToastType.success,
            msg: state.message,
          );
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.password,
            (route) => false,
            arguments: widget.email,
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            OtpField(controllers: controllers),
            const SizedBox(height: 10),
            AccountTextspan(
                align: Alignment.centerLeft,
                infoText: AppStrings.codeReceive,
                functionText: AppStrings.resend,
                fontSize: context.isTablet ? 20 : 16,
                onPressed: () {}),
            const SizedBox(height: 20),
            DarkRoundedButton(
              title: AppStrings.continueBtn,
              onPressed: () {
                String otp =
                    controllers.map((controller) => controller.text).join();
                context.read<SignUpBloc>().add(VerifyOtp(
                        dto: OtpRequestDto(
                      type: OtpType.verifyUser,
                      email: widget.email,
                      otp: otp,
                    )));
              },
            ),
          ],
        );
      },
    );
  }
}
