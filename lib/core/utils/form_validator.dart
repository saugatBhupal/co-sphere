
import 'package:cosphere/core/constants/app_strings.dart';
import 'package:cosphere/core/utils/text_utils.dart';

class FormValidator {
  static String? validateEmail(String? val, [bool supportEmpty = false]) {
    if (supportEmpty && (val == null || val.isEmpty)) {
      return null;
    } else if (val == null) {
      return ("${AppStrings.email} ${AppStrings.fieldRequired}");
    } else if (val.isEmpty) {
      return ("${AppStrings.email} ${AppStrings.fieldRequired}");
    } else if (TextUtils.validateEmail(val)) {
      return null;
    } else {
      return AppStrings.validEmail;
    }
  }

  static String? validateTitle(String? val, String label) {
    if (val == null) {
      return ("$label ${AppStrings.fieldRequired}");
    } else if (val.isEmpty) {
      return ("$label ${AppStrings.fieldRequired}");
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val, {String? label}) {
    if (val == null || val.isEmpty) {
      return ("Password ${AppStrings.fieldRequired}");
    } else if (val.length < 8) {
      return (AppStrings.passwordLength);
    } else if (!RegExp(r'^(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).+$')
        .hasMatch(val)) {
      return (AppStrings.invalidPassword);
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? val,
    String? newPassword,
  ) {
    if (val == null) {
      return ("Password ${AppStrings.fieldRequired}");
    } else if (val.isEmpty) {
      return ("Password ${AppStrings.fieldRequired}");
    } else if (!RegExp(r'^(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).+$')
        .hasMatch(val)) {
      return (AppStrings.invalidPassword);
    } else if (val.length >= 8) {
      if (val == newPassword) {
        return null;
      } else {
        return AppStrings.passwordMatch;
      }
    } else {
      return (AppStrings.passwordLength);
    }
  }

  static String? validateDOB(String? val) {
    if (val == null || val.isEmpty) {
      return "${AppStrings.dob} ${AppStrings.fieldRequired}";
    }
    final regex = RegExp(r'^\d{2}\s?-\s?\d{2}\s?-\s?\d{4}$');
    if (!regex.hasMatch(val)) {
      return AppStrings.invalidDob;
    }
    final parts = val.split(RegExp(r'\s?-\s?'));
    if (parts.length != 3) {
      return AppStrings.invalidDob;
    }
    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);

    print("$day / $month / $year");
    final currentYear = DateTime.now().year;
    if (day == null || day < 1 || day > 31) {
      return 'Invalid day. Day should be between 01 and 31';
    }
    if (month == null || month < 1 || month > 12) {
      return 'Invalid month. Month should be between 01 and 12';
    }
    if (year == null || year > currentYear) {
      return 'Invalid year. Year cannot be greater than the current year';
    }
    if ((month == 4 || month == 6 || month == 9 || month == 11) && day > 30) {
      return 'This month has only 30 days';
    }
    if (month == 2) {
      final isLeapYear =
          (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
      if (day > 29 || (day == 29 && !isLeapYear)) {
        return 'February has only 28 days or 29 days in a leap year';
      }
    }
    return null;
  }
}
