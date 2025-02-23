import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/button/skills_button.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/task_card.dart';
import 'package:cosphere/src/features/search/presentation/widgets/start_chat_button.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';

class UserSearchCard extends StatelessWidget {
  final User user;
  const UserSearchCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.hiring),
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(width: 1, color: AppColors.plaster),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: context.isTablet ? 50 : 40,
                    width: context.isTablet ? 50 : 40,
                    decoration: BoxDecoration(
                      color: AppColors.frog,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.fullname,
                            style: _textTheme.bodySmall!.copyWith(
                              letterSpacing: 0,
                              fontSize: context.isTablet ? 16 : 12,
                              color: AppColors.black,
                              fontWeight: FontThickness.regular,
                            )),
                        Text(
                          "${user.city} ${user.country}",
                          style: _textTheme.labelLarge!.copyWith(
                            height: 1,
                            fontSize: context.isTablet ? 14 : 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const StartChatButton()
                ],
              ),
              if (user.skills != null && user.skills!.isNotEmpty) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: user.skills!
                          .take(2)
                          .map((skill) => SkillsButton(
                                name: skill.name,
                                borderRadius: 4,
                                fontSize: context.isTablet ? 14 : 10,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 12),
                              ))
                          .toList(),
                    ),
                    const SizedBox(width: 6),
                    if (user.skills!.length > 2) ...[
                      const SizedBox(width: 6),
                      SkillsButton(
                        name: "+${user.skills!.length - 2} more",
                        borderRadius: 4,
                        fontSize: context.isTablet ? 14 : 10,
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                      ),
                    ],
                  ],
                ),
              ],
              if (user.about != null && user.about!.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  user.about!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: _textTheme.bodySmall!.copyWith(
                    letterSpacing: 0,
                    fontSize: context.isTablet ? 16 : 12,
                    fontWeight: FontThickness.light,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
