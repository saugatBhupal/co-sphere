import 'package:cosphere/src/core/constants/app_enums.dart';

extension StatusExtension on Status {
  String toDatabaseValue() {
    switch (this) {
      case Status.pending:
        return "Pending";
      case Status.accepted:
        return "Accepted";
      case Status.active:
        return "Active";
      case Status.rejected:
        return "Rejected";
    }
  }

  static Status fromDatabaseValue(String value) {
    switch (value) {
      case "Pending":
        return Status.pending;
      case "Active":
        return Status.active;
      case "Rejected":
        return Status.rejected;
      case "Accepted":
        return Status.accepted;
      default:
        throw ArgumentError("Invalid status value: $value");
    }
  }
}
