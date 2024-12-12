import 'package:flutter/material.dart';

import 'package:cosphere/constants/app_colors.dart';
import 'package:cosphere/constants/app_fonts.dart';

class MultiSelectChipButton extends StatefulWidget {
  final List<String> interestList;
  const MultiSelectChipButton({
    super.key,
    required this.interestList,
  });

  @override
  State<MultiSelectChipButton> createState() => _MultiSelectChipButtonState();
}

class _MultiSelectChipButtonState extends State<MultiSelectChipButton> {
  List<String> selectedInterests = [];

  List<Widget> _buildInterestList() {
    return widget.interestList.map((item) {
      bool isSelected = selectedInterests.contains(item);
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: ChoiceChip(
          label: Text(item),
          labelStyle: TextStyle(
            color: isSelected ? AppColors.plaster : AppColors.midnight,
            fontFamily: AppFonts.albertSans,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
          showCheckmark: false,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(32.0),
          ),
          backgroundColor: AppColors.plaster,
          selectedColor: AppColors.midnight,
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              selectedInterests.contains(item)
                  ? selectedInterests.remove(item)
                  : selectedInterests.add(item);
            });
          },
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: _buildInterestList());
  }
}
