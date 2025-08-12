import 'package:techara_merchant/src/core/translation/translation_data.dart';

extension TranslationExtension on String {
  String tr(String lang) {
    return getTranslation(lang == 'English' ? 'en' : 'ar', this);
  }
}
