import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/cards/experience_card.dart';
import 'package:flutter/material.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "${AppStrings.professional} ${AppStrings.overview}",
          style: _textTheme.bodyLarge!.copyWith(
            fontWeight: FontThickness.semiBold,
            color: AppColors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris viverra pharetra ligula, nec mattis quam porta vitae. Nullam a congue neque, nec volutpat justo. Nullam et est condimentum, bibendum neque id, congue quam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum magna lacus, aliquam ut sapien quis, dignissim mattis lectus. Fusce facilisis diam magna, sit amet feugiat metus hendrerit.",
          style: _textTheme.bodyLarge!.copyWith(
            color: AppColors.silver,
            height: 0,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          AppStrings.experience,
          style: _textTheme.bodyLarge!.copyWith(
            fontWeight: FontThickness.semiBold,
            color: AppColors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => const ExperienceCard(
                position: "UI|UX Developer",
                comapany: "Odama Studios",
                role: "senior",
                from: "2023",
                to: "2024",
              ),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 24);
              },
            ),
          ),
        ),
      ],
    );
  }
}
