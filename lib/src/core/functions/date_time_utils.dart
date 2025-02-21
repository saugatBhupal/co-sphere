String dateTimeUtil(DateTime timestamp) {
  DateTime currentTime = DateTime.now();
  Duration timeDifference = currentTime.difference(timestamp);

  int seconds = timeDifference.inSeconds;
  int minutes = (seconds / 60).floor();
  int hours = (minutes / 60).floor();
  int days = (hours / 24).floor();
  int months = (days / 30).floor();
  int years = (months / 12).floor();

  if (years >= 1) {
    return '${years}y ';
  } else if (months >= 1) {
    return '${months}m ';
  } else if (days >= 1) {
    return '${days}d ';
  } else if (hours >= 1) {
    return '${hours}h ';
  } else if (minutes >= 1) {
    return '${minutes}m  ';
  } else {
    return '${seconds}s';
  }
}

String timeAgo(DateTime inputTime) {
  final Duration difference = DateTime.now().difference(inputTime);

  if (difference.inDays >= 30) {
    return "${difference.inDays ~/ 30} month${difference.inDays ~/ 30 > 1 ? 's' : ''} ago";
  } else if (difference.inDays >= 1) {
    return "${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago";
  } else if (difference.inHours >= 1) {
    return "${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago";
  } else if (difference.inMinutes >= 1) {
    return "${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago";
  } else {
    return "${difference.inSeconds} second${difference.inSeconds > 1 ? 's' : ''} ago";
  }
}

String extractCreatedDate(String createdAt) {
  DateTime dateTime = DateTime.parse(createdAt);
  String formattedDate =
      "${_getMonth(dateTime.month)} ${_twoDigits(dateTime.day)}, ${dateTime.year}";

  return formattedDate;
}

String extractDate(DateTime createdAt) {
  String formattedDate =
      "${_getMonthAb(createdAt.month)} ${_twoDigits(createdAt.day)}, ${createdAt.year}";
  return formattedDate;
}

String extractTime(DateTime dateTime) {
  String formattedTime =
      "${_twoDigitsTime(dateTime.hour)}:${_twoDigitsTime(dateTime.minute)}";
  return formattedTime;
}

String _twoDigitsTime(int number) {
  return number.toString().padLeft(2, '0');
}

String _twoDigits(int n) {
  if (n >= 10) {
    return "$n";
  } else {
    return "0$n";
  }
}

String _getMonthAb(int month) {
  switch (month) {
    case 1:
      return "Jan";
    case 2:
      return "Feb";
    case 3:
      return "Mar";
    case 4:
      return "Apr";
    case 5:
      return "May";
    case 6:
      return "Jun";
    case 7:
      return "Jul";
    case 8:
      return "Aug";
    case 9:
      return "Sep";
    case 10:
      return "Oct";
    case 11:
      return "Nov";
    case 12:
      return "Dec";
    default:
      return "";
  }
}

String _getMonth(int month) {
  switch (month) {
    case 1:
      return "January";
    case 2:
      return "February";
    case 3:
      return "March";
    case 4:
      return "April";
    case 5:
      return "May";
    case 6:
      return "June";
    case 7:
      return "July";
    case 8:
      return "August";
    case 9:
      return "September";
    case 10:
      return "October";
    case 11:
      return "November";
    case 12:
      return "December";
    default:
      return "";
  }
}

String getMessageDate(DateTime timestamp, DateTime? previousMessageDate) {
  if (previousMessageDate != null &&
      isSameDay(previousMessageDate, timestamp)) {
    return '';
  } else {
    return extractCreatedDate(timestamp.toIso8601String());
  }
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
