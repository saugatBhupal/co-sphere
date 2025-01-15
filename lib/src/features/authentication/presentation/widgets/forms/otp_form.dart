import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/widgets/input_fields/otp_field.dart';
import 'package:cosphere/widgets/textSpan.dart/account_textspan.dart';
import 'package:flutter/material.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

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
    return Column(
      children: [
        OtpField(controllers: controllers),
        const SizedBox(height: 10),
        AccountTextspan(
            align: Alignment.centerLeft,
            infoText: AppStrings.codeReceive,
            functionText: AppStrings.resend,
            fontSize: 16,
            onPressed: () {}),
        const SizedBox(height: 20),
        DarkRoundedButton(
          title: AppStrings.continueBtn,
          onPressed: () => Navigator.of(context).pushNamed(AppRoutes.password),
        ),
      ],
    );
  }
}
