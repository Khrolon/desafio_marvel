
import 'package:marvel/app/locales/en_US/en_us_translations.dart';
import 'package:marvel/app/locales/pt_BR/pt_br_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'pt_BR': ptBR,
    'en_US': enUs,
  };
}