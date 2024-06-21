import 'package:bhc_mobile_app/util/formatters.dart';

abstract class Validators {
  static String? emailValidator(String? email) {
    const template =
        r'^[*+\/0-9=?A-Z_a-z{|}~](\.?[-+\/0-9=?A-Z_a-z`{|}~])*@[a-zA-Z0-9](-*\.?[a-zA-Z0-9])*\.[a-zA-Z](-?[a-zA-Z0-9])+$';
    const error = 'Invalid email';

    if (email != null) {
      final parts = email.split('@');
      if (parts.length > 2) return error;
      if (parts.length <= 2 && parts[0].length > 64) return error;
      if (parts.length == 2 && parts[1].length > 64) return error;
    }
    RegExp regExp = RegExp(template);

    return regExp.hasMatch(email!.trim()) ? null : error;
  }

  static String? dateValidator(String? date) {
    const template =
        r'^(3[01]|[12][0-9]|0?[1-9])\.(1[012]|0[1-9])\.((?:19|20)\d{2})';
    const error = '';
    RegExp regExp = RegExp(template);

    return regExp.hasMatch(date!.trim()) ? null : error;
  }

  static String? dateRangeValidator(String? dateRange) {
    if (dateRange == null || dateRange.isEmpty) {
      return null;
    }

    return isDateRangeValid(dateRange) ? null : '';
  }

  static bool isDateRangeValid(String dateRange) {
    const regexString =
        r"^(0?[1-9]|[12][0-9]|3[01])\.(0?[1-9]|1[0-2])\.\d\d\d\d\s-\s(0?[1-9]|[12][0-9]|3[01])\.(0?[1-9]|1[0-2])\.\d\d\d\d$";

    final bool isRegexpMatch = RegExp(regexString).hasMatch(dateRange);

    if (isRegexpMatch) {
      final customPeriodsList = dateRange.replaceAll(' ', '').split('-');

      final startDate = DateFormatter.dayMonthYear.parse(customPeriodsList[0]);
      final endDate = DateFormatter.dayMonthYear.parse(customPeriodsList[1]);

      final bool isEndBeforeNow = endDate.isBefore(DateTime.now());
      final bool isStartBeforeEnd = startDate.isBefore(endDate);

      return isStartBeforeEnd && isEndBeforeNow;
    } else {
      return false;
    }
  }
}
