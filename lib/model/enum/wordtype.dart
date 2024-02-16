import 'package:collection/collection.dart';
import 'package:kare_kyoushi/util/locale/localization_keys.dart';

enum WordType {
  noun(value: '&n;', titleKey: LocalizationKeys.noun),
  adjective(value: '&adj-i;', titleKey: LocalizationKeys.adjective);

  final String value;
  final String titleKey;

  const WordType({
    required this.value,
    required this.titleKey,
  });
}

extension WordTypeExtension on String {
  WordType? toWordType() => WordType.values.firstWhereOrNull((element) => element.value == this);
}
