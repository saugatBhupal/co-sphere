import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/widgets/input_fields/link_field.dart';
import 'package:flutter/material.dart';

class EditLinks extends StatefulWidget {
  const EditLinks({super.key});

  @override
  State<EditLinks> createState() => _EditLinksState();
}

class _EditLinksState extends State<EditLinks> {
  late final TextEditingController _linkedInController;
  late final TextEditingController _instagramController;
  late final TextEditingController _facebookController;

  @override
  void initState() {
    _linkedInController = TextEditingController();
    _instagramController = TextEditingController();
    _facebookController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _linkedInController.dispose();
    _instagramController.dispose();
    _facebookController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const _gap = SizedBox(height: 20);
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(width: 0.4, color: AppColors.plaster),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          LinkField(
            textController: _linkedInController,
            label: AppStrings.linkedIn,
            hintText: AppStrings.linkedInLink,
          ),
          _gap,
          LinkField(
            textController: _instagramController,
            label: AppStrings.instagram,
            hintText: AppStrings.instagramLink,
          ),
          _gap,
          LinkField(
            textController: _facebookController,
            label: AppStrings.facebook,
            hintText: AppStrings.facebookLink,
          ),
          _gap,
          DarkRoundedButton(
            title: "${AppStrings.add} ${AppStrings.more}",
            height: context.height / 20,
            fontSize: 14,
            padding: const EdgeInsets.symmetric(vertical: 8),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
