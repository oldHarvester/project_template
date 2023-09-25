import 'package:easy_localization/easy_localization.dart';

extension NumExtension on num {
  String deccimal([int digits = 0]) {
    return NumberFormat.decimalPatternDigits(
            locale: 'ru', decimalDigits: digits)
        .format(this);
  }

  String get sumCurrency {
    return '${deccimal()} сум';
  }
}
