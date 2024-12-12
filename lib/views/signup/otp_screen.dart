import 'package:cosphere/config/app_routes/app_routes.dart';
import 'package:cosphere/constants/app_colors.dart';
import 'package:cosphere/constants/app_fonts.dart';
import 'package:cosphere/constants/app_strings.dart';
import 'package:cosphere/widgets/appbar/authentication_appbar.dart';
import 'package:cosphere/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/widgets/input_fields/otp_field.dart';
import 'package:cosphere/widgets/textSpan.dart/account_textspan.dart';
import 'package:cosphere/widgets/textSpan.dart/auth_message.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthenticationAppbar(),
              const SizedBox(height: 20),
              const AuthMessage(
                  title: AppStrings.otpTitle, subtitle: AppStrings.otpSubtitle),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  AppStrings.emailEx,
                  style: TextStyle(
                    fontFamily: AppFonts.albertSans,
                    color: AppColors.midnight,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.password),
              ),
              const SizedBox(height: 15),
              AccountTextspan(
                infoText: AppStrings.haveAccount,
                functionText: AppStrings.signin,
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.signin),
              )
            ],
          ),
        ),
      ),
    );
  }
}
