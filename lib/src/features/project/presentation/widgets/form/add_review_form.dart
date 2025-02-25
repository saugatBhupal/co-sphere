import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/utils/enum_mapper.dart';
import 'package:cosphere/src/core/widgets/buttons/status_button.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/review_mapper.dart';
import 'package:cosphere/src/features/profile/domain/entities/reviews.dart';
import 'package:cosphere/src/features/project/data/dto/add_review/add_review_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/complete_project/complete_project_req_dto.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/project/presentation/widgets/components/star_rating.dart';
import 'package:cosphere/src/features/project/presentation/widgets/form/complete_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/textspan_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddReviewForm extends StatefulWidget {
  final String projectId;
  final List<User> members;
  const AddReviewForm({
    super.key,
    required this.projectId,
    required this.members,
  });

  @override
  State<AddReviewForm> createState() => _AddReviewFormState();
}

class _AddReviewFormState extends State<AddReviewForm> {
  late List<TextEditingController> _reviewControllers;
  late List<int> _ratings;
  late List<Reviews> _reviews;

  CompletionType? completionType;

  @override
  void initState() {
    super.initState();
    _reviewControllers =
        List.generate(widget.members.length, (_) => TextEditingController());
    _ratings = List.generate(widget.members.length, (_) => 0);
    _reviews = List.generate(widget.members.length,
        (index) => Reviews.initial().copyWith(id: widget.members[index].uid));
  }

  @override
  void dispose() {
    for (var controller in _reviewControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _submitReviews() {
    List<Reviews> submittedReviews = [];
    for (int i = 0; i < widget.members.length; i++) {
      final review = _reviewControllers[i].text;
      final rating = _ratings[i];
      submittedReviews
          .add(_reviews[i].copyWith(review: review, rating: rating));
    }
    AddReviewReqDto reqDto = AddReviewReqDto(
        projectId: widget.projectId,
        reviews: submittedReviews.map((e) => e.fromDomain()).toList());
    print(reqDto.reviews.map((e) => e.review));
    context.read<ProjectBloc>().add(AddReview(
            dto: AddReviewReqDto(
          projectId: widget.projectId,
          reviews: submittedReviews.map((e) => e.fromDomain()).toList(),
        )));
    ;
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    const gap = SizedBox(height: 18);
    final _formKey = GlobalKey<FormState>();

    return BlocListener<ProjectBloc, ProjectState>(
      listener: (context, state) {
        if (state is AddReviewSuccess) {
          buildToast(
              toastType: ToastType.success, msg: "Review Added Successfully");
          context.read<ProjectBloc>().add(CompleteProject(
              dto: CompleteProjectReqDto(
                  projectId: widget.projectId,
                  completionType: completionType!)));
        }
        if (state is AddReviewFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is CompleteProjectFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is CompleteProjectSuccess) {
          buildToast(toastType: ToastType.success, msg: state.message);
          Navigator.of(context).popAndPushNamed(AppRoutes.completed,
              arguments: widget.projectId);
        }
      },
      child: SingleChildScrollView(
        child: Container(
          width: context.width,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.reviewTitle,
                  style: _textTheme.bodyLarge!.copyWith(
                    fontWeight: FontThickness.semiBold,
                    color: AppColors.black,
                  ),
                ),
                gap,
                if (completionType != null) ...[
                  StatusButton(label: completionType!.toDatabaseValue()),
                  gap,
                ],
                CompleteDropdown(
                  selectedItem: completionType,
                  items: const [
                    CompletionType.delayed,
                    CompletionType.early,
                    CompletionType.ontime
                  ],
                  onChanged: (value) {
                    setState(() {
                      completionType = value;
                      print(completionType);
                    });
                  },
                ),
                gap,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.members.length,
                  itemBuilder: (context, index) {
                    final member = widget.members[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${AppStrings.reviewSubtitle}${member.fullname}",
                            style: _textTheme.bodySmall!.copyWith(
                              color: AppColors.black,
                              fontWeight: FontThickness.regular,
                            )),
                        const SizedBox(height: 8),
                        TextspanField(
                          textController: _reviewControllers[index],
                          hintText: AppStrings.reviewHint,
                        ),
                        const SizedBox(height: 8),
                        StarRatingWidget(
                          initialRating: _ratings[index],
                          onRatingChanged: (value) {
                            setState(() {
                              _ratings[index] = value;
                              print(_ratings[index]);
                            });
                          },
                        ),
                        const SizedBox(height: 8),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 8),
                DarkRoundedButton(
                  title: AppStrings.submitReview,
                  fontSize: 12,
                  onPressed: _submitReviews,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
