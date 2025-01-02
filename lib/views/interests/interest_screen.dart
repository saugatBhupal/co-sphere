import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/widgets/appbar/authentication_appbar.dart';
import 'package:cosphere/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/widgets/buttons/multi_select_chip_button.dart';
import 'package:cosphere/widgets/textSpan.dart/account_textspan.dart';
import 'package:cosphere/widgets/textSpan.dart/auth_message.dart';
import 'package:flutter/material.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> reportList = [
      "React",
      "Mobile Development",
      "Photography",
      "Video Editing",
      "Graphic Design",
      "Content Writing",
      "UI/UX Design",
      "Analytics",
      "Cybersecurity",
      "Machine Learning",
      "Data Science",
    ];

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 28),
                  child: AuthenticationAppbar(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AuthMessage(
                          title: AppStrings.interestTitle,
                          subtitle: AppStrings.interstSubtitle,
                        ),
                        const SizedBox(height: 10),
                        MultiSelectChipButton(interestList: reportList),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DarkRoundedButton(
                          title: AppStrings.continueBtn,
                          onPressed: () =>
                              Navigator.of(context).pushNamed(AppRoutes.home)),
                      const SizedBox(height: 10),
                      AccountTextspan(
                        infoText: AppStrings.haveAccount,
                        functionText: AppStrings.signin,
                        onPressed: () =>
                            Navigator.of(context).pushNamed(AppRoutes.signin),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
