import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => sl<DashboardBloc>()..add(LoadUserEvent()),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardGetCacheUserSuccess) {
            return Padding(
              padding: const EdgeInsets.only(top: 26),
              child: AppBar(
                forceMaterialTransparency: true,
                backgroundColor: AppColors.satin,
                foregroundColor: AppColors.satin,
                elevation: 0,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                title: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${AppStrings.hi} ${state.user.fullname},",
                              style: _textTheme.headlineSmall!
                                  .copyWith(height: 1.2),
                            ),
                            Text(
                              AppStrings.welcomeBack,
                              style: _textTheme.headlineLarge!
                                  .copyWith(color: AppColors.midnight),
                            ),
                          ],
                        ),
                      ),
                      CircleImageAvatar(
                          radius: 26,
                          imageUrl:
                              state.user.profileImage ?? AppImages.profile),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(95);
}
