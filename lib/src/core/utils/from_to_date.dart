String calculateDuration(DateTime from, DateTime to) {
  Duration difference = to.difference(from);

  int days = difference.inDays;
  int months = (days / 30).floor();
  int years = (months / 12).floor();

  if (years >= 1) {
    return "$years year${years > 1 ? 's' : ''}";
  } else if (months >= 1) {
    return "$months month${months > 1 ? 's' : ''}";
  } else {
    return "$days day${days > 1 ? 's' : ''}";
  }
}

String formatDate(DateTime date) {
  return "${_getMonth(date.month)} ${date.year}";
}

String _getMonth(int month) {
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
