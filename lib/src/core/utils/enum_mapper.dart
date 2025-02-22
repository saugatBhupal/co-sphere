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
      case Status.hiring:
        return "Hiring";
      case Status.completed:
        return "Completed";
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
      case "Hiring":
        return Status.hiring;
      case "Completed":
        return Status.completed;
      default:
        throw ArgumentError("Invalid status value: $value");
    }
  }
}

extension CompletionExtension on CompletionType {
  String toDatabaseValue() {
    switch (this) {
      case CompletionType.delayed:
        return "Delayed";
      case CompletionType.ontime:
        return "On-Time";
      case CompletionType.early:
        return "Early";
    }
  }

  static CompletionType fromDatabaseValue(String value) {
    switch (value) {
      case "Delayed":
        return CompletionType.delayed;
      case "On-Time":
        return CompletionType.ontime;
      case "Early":
        return CompletionType.early;
      default:
        throw ArgumentError("Invalid status value: $value");
    }
  }
}
