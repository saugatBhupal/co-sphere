import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:cosphere/src/features/authentication/presentation/viewmodels/bloc/sign_up_bloc.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/appbar/authentication_appbar.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/textspan/account_textspan.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/textspan/auth_message.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/buttons/multi_select_chip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InterestScreen extends StatelessWidget {
  final SignupParams params;
  const InterestScreen({super.key, required this.params});

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
                        onPressed: () => Navigator.of(context)
                            .pushNamed(AppRoutes.dashboard),
                      ),
                      const SizedBox(height: 10),
                      AccountTextspan(
                        infoText: AppStrings.haveAccount,
                        functionText: AppStrings.signin,
                        onPressed: () =>
                            context
                                .read<SignUpBloc>()
                                .add(AuthSignUp(params: params)),
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
