import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/button/more_button.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/cards/edit_pop_up.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/cards/education_card.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_education.dart';
import 'package:flutter/material.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.education,
            style: _textTheme.bodyLarge!.copyWith(
              fontWeight: FontThickness.semiBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => const EducationCard(
                  organization: "Odama Studios",
                  degree: "UI|UX Developer",
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
                // showEditDialog(context: context, child: const EditEducation());
              },
            ),
          ),
        ],
      ),
    );
  }
}
