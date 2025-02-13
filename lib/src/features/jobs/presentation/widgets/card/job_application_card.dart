import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/buttons/status_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JobApplicationCard extends StatelessWidget {
  const JobApplicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final List tag = ["Remote", "Full Time", "Company"];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      height: context.height / 6.5,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(width: 1, color: AppColors.plaster),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.frog,
                  border: Border.all(width: 1, color: AppColors.plaster),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Esewa",
                      style: _textTheme.labelLarge!.copyWith(height: 1),
                    ),
                    Text("Product Designer",
                        style:
                            _textTheme.bodyLarge!.copyWith(letterSpacing: 0)),
                  ],
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: StatusButton(
                  label: "active",
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.location,
                ),
                const SizedBox(width: 6),
                Text("Kathmandu, Nepal",
                    style: _textTheme.labelLarge!
                        .copyWith(color: AppColors.black)),
              ],
            ),
          ),
          Row(
            children: List.generate(tag.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  tag[index],
                  style: _textTheme.labelLarge,
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
