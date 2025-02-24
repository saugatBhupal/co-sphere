import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StarRatingWidget extends StatefulWidget {
  final Function(int) onRatingChanged;
  final int initialRating;

  const StarRatingWidget({
    super.key,
    required this.onRatingChanged,
    this.initialRating = 0,
  });

  @override
  _StarRatingWidgetState createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  void _handleStarClick(int star) {
    setState(() {
      _rating = star;
    });
    widget.onRatingChanged(_rating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        int star = index + 1;
        return GestureDetector(
          onTap: () => _handleStarClick(star),
          child: Icon(
            Icons.star_rate,
            color: star <= _rating ? AppColors.midnight : AppColors.dim,
            size: 22,
          ),
        );
      }),
    );
  }
}
