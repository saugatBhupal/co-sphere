import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/search/presentation/viewmodels/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/features/search/presentation/widgets/cards/user_search_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSearch extends StatelessWidget {
  final String query;
  final User user;
  const UserSearch({
    super.key,
    required this.query,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => sl<SearchBloc>()..add(GetUserByName(query: query)),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is GetUserByNameSuccess) {
            if (state.users.isEmpty) {
              return Center(
                child: Text(
                  "No User Name $query",
                  style: _textTheme.bodyMedium!.copyWith(color: AppColors.grey),
                ),
              );
            } else {
              return SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: state.users.length,
                  itemBuilder: (context, index) => UserSearchCard(
                    searchUser: state.users[index],
                    user: user,
                  ),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                ),
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}
