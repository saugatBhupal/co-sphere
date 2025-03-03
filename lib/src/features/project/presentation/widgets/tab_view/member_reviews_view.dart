import 'package:cosphere/src/features/profile/domain/entities/reviews.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/member_review_card.dart';
import 'package:flutter/widgets.dart';

class MemberReviewsView extends StatelessWidget {
  final List<Reviews> reviews;
  final String projectId;
  const MemberReviewsView(
      {super.key, required this.reviews, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: reviews.length,
      itemBuilder: (context, index) => MemberReviewCard(
        reviewId: reviews[index].id,
        projectId: projectId,
      ),
      separatorBuilder: (context, index) => const SizedBox(),
    );
  }
}
