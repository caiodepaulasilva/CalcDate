abstract class DateResultBase {
  int months;
  int days;
  int totalMonths;
  int totalDays;
  int totalYears;

  init() {
    months = 0;
    days = 0;
    totalMonths = 0;
    totalDays = 0;
    totalYears = 0;
  }
}

class DateResult extends DateResultBase {
  static final DateResult _dateResult = DateResult._internal();
  factory DateResult() => _dateResult;

  DateResult._internal();
}
