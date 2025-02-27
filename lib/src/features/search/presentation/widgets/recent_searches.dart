import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/search/data/dto/add_search_history_req_dto/add_search_history_req_dto.dart';
import 'package:cosphere/src/features/search/presentation/viewmodels/search_bloc.dart';
import 'package:cosphere/src/features/search/presentation/widgets/search_results_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RecentSearches extends StatelessWidget {
  final User user;
  const RecentSearches({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    String searchQuery = "";
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) =>
          sl<SearchBloc>()..add(GetSearchHistory(uid: user.uid)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is AddSearchHistorySuccess && searchQuery != "") {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.results,
                      style: textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: context.isTablet ? 18 : 14,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.5,
                      child: SearchResultsTabbar(
                          query: searchQuery, user: user),
                    ),
                  ],
                );
              }
              if (state is SearchHistoryLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is SearchHistoryFailed) {
                return Center(child: Text("Error: ${state.message}"));
              }
              if (state is GetSearchHistorySuccess) {
                if (state.search.isEmpty) {
                  return Text(
                    "No Search History",
                    style:
                        textTheme.bodyMedium!.copyWith(color: AppColors.grey),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: AppColors.plaster, width: 0.8),
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.clock,
                              height: context.isTablet ? 30 : 20,
                              width: context.isTablet ? 30 : 20,
                              colorFilter: const ColorFilter.mode(
                                  Color(0xFF949292), BlendMode.srcIn),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              AppStrings.recent,
                              style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: context.isTablet ? 18 : 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      ...state.search.map((searchItem) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: GestureDetector(
                            onTap: () {
                              searchQuery = searchItem.query;
                              context.read<SearchBloc>().add(
                                    AddSearchHistory(
                                      dto: AddSearchHistoryReqDto(
                                          userId: user.uid,
                                          query: searchItem.query),
                                    ),
                                  );
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.search,
                                  height: context.isTablet ? 30 : 20,
                                  width: context.isTablet ? 30 : 20,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  searchItem.query,
                                  style: textTheme.bodyMedium!.copyWith(
                                    color: AppColors.grey,
                                    fontSize: context.isTablet ? 18 : 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                }
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
