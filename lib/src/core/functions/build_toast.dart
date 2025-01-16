import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_extensions.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> buildToast({
  required ToastType toastType,
  required String msg,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: toastType.getColor(),
    textColor: AppColors.white,
  );
}
