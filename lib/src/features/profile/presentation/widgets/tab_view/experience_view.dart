import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/button/more_button.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/cards/edit_pop_up.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/cards/experience_card.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_experience.dart';
import 'package:flutter/material.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      width: context.width,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(width: 0.4, color: AppColors.plaster),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${AppStrings.professional} ${AppStrings.overview}",
            style: _textTheme.bodyLarge!.copyWith(
              fontWeight: FontThickness.semiBold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris viverra pharetra ligula, nec mattis quam porta vitae. Mauris viverra pharetra ligula, nec mattis quam porta vitae.",
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
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => const ExperienceCard(
                  position: "UI|UX Developer",
                  organization: "Odama Studios",
                  status: "intern",
                  from: "2023",
                  to: "2024",
                ),
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 24);
                },
              ),
            ),
          ),
          Center(
            child: MoreButton(
              title: "${AppStrings.add} ${AppStrings.more}",
              onPressed: () {
                showEditDialog(context: context, child: const EditExperience());
              },
            ),
          ),
        ],
      ),
    );
  }
}
