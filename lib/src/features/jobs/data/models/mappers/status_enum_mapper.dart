import 'package:cosphere/src/core/constants/app_enums.dart';

extension StatusExtension on Status {
  String toDatabaseValue() {
    switch (this) {
      case Status.pending:
        return "Pending";
      case Status.accepted:
        return "Accepted";
      case Status.rejected:
        return "Rejected";
    }
  }

  static Status fromDatabaseValue(String value) {
    switch (value) {
      case "Pending":
        return Status.pending;
      case "Accepted":
        return Status.accepted;
      case "Rejected":
        return Status.rejected;
      default:
        throw ArgumentError("Invalid status value: $value");
    }
  }
}
