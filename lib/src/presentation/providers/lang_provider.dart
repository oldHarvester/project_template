import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/constants/supported_languages.dart';

final langProvider = StateProvider(
  (ref) => Language.initialLocale,
);
