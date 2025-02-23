import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/utils/form_validator.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/dob_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/email_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/input_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/phone_field.dart';
import 'package:flutter/material.dart';

class EditPersonalDetails extends StatefulWidget {
  const EditPersonalDetails({super.key});

  @override
  State<EditPersonalDetails> createState() => _EditPersonalDetailsState();
}

class _EditPersonalDetailsState extends State<EditPersonalDetails> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _dobController;
  late final TextEditingController _emailController;
  late final TextEditingController _addressController;
  bool showContact = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "Saugat Bhupal Singh");
    _phoneController = TextEditingController(text: "9800809909");
    _dobController = TextEditingController(text: "13-07-2002");
    _emailController = TextEditingController(text: "saugat@gmail.com");
    _addressController =
        TextEditingController(text: "Kalanki, Kathmandu, Nepal");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _gap = SizedBox(height: 20);
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(width: 0.4, color: AppColors.plaster),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputField(
            textController: _nameController,
            label: AppStrings.fullName,
            color: AppColors.black.withOpacity(0.68),
            validator: (val) {
              return FormValidator.validateTitle(val, AppStrings.fullName);
            },
          ),
          _gap,
          Row(
            children: [
              SizedBox(
                width: context.width / 3.3,
                child: DobField(
                  dobController: _dobController,
                  color: AppColors.black.withOpacity(0.68),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: PhoneField(
                  phoneController: _phoneController,
                  label: AppStrings.phone,
                  color: AppColors.black.withOpacity(0.68),
                  validator: (val) {
                    return FormValidator.validateTitle(val, AppStrings.phone);
                  },
                ),
              ),
            ],
          ),
          _gap,
          EmailField(
            emailController: _emailController,
            label: AppStrings.email,
            color: AppColors.black.withOpacity(0.68),
            validator: (val) {
              return FormValidator.validateEmail(val);
            },
          ),
          _gap,
          InputField(
            textController: _addressController,
            label: AppStrings.address,
            color: AppColors.black.withOpacity(0.68),
            validator: (value) =>
                FormValidator.validateTitle(value, AppStrings.city),
          ),
          ListTileTheme(
            horizontalTitleGap: 0,
            minVerticalPadding: 18,
            child: CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(AppStrings.contactPer,
                  style: _textTheme.titleSmall!.copyWith(letterSpacing: 0)),
              value: showContact,
              dense: true,
              onChanged: (newValue) {
                setState(() {
                  showContact = newValue!;
                });
              },
              side: const BorderSide(
                color: AppColors.grey,
              ),
              contentPadding: EdgeInsets.zero,
            ),
          ),
          DarkRoundedButton(
            title: AppStrings.save,
            height: context.height / 20,
            fontSize: context.isTablet ? 18 : 14,
            padding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ],
      ),
    );
  }
}
