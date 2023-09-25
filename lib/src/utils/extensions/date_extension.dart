// ignore_for_file: non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:template/src/utils/extensions/string_extension.dart';

extension DateExtension on DateTime {
  String get dMyHm {
    return DateFormat('dd.MM.yyyy / HH:mm', 'ru').format(this);
  }

  String get ms {
    return DateFormat('mm:ss').format(this);
  }

  String get HmdMy {
    return DateFormat('HH:mm / dd MMM yyyy', 'ru').format(this);
  }

  String get dMy {
    return DateFormat('dd.MM.yyyy', 'ru').format(this);
  }

  String get hm {
    return DateFormat('HH:mm', 'ru').format(this);
  }

  String get dm {
    return DateFormat('dd MMMM', 'ru').format(this);
  }

  String get Ed {
    return DateFormat('EE d', 'ru').format(this).capitalize;
  }

  String get MMMM {
    return DateFormat('MMMM', 'ru').format(this);
  }

  String get MMMMyyyy {
    const monthNames = [
      "Январь",
      "Февраль",
      "Март",
      "Апрель",
      "Май",
      "Июнь",
      "Июль",
      "Август",
      "Сентябрь",
      "Октябрь",
      "Ноябрь",
      "Декабрь"
    ];
    return '${monthNames[month - 1]}, $year';
  }
}
