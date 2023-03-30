import 'dart:ui';

import 'package:boat_owner/app/modeules/auth/controller/profile_step_controller.dart';
import 'package:boat_owner/app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationController extends BaseController implements GetxService {
  static LocalizationController find = Get.find();
  String currentLanguage = AppConstants.ENGLISH_LANGUAGE_CODE;

  bool isEnglish() {

    return currentLanguage == AppConstants.ENGLISH_LANGUAGE_CODE;
  }
  isArabic(){
    print("${currentLanguage}" + " lang");
    print(currentLanguage == AppConstants.ARABIC_LANGUAGE_CODE);
    return currentLanguage == AppConstants.ARABIC_LANGUAGE_CODE;
  }

  getTranlsatedNumbers(number) {
    if (isEnglish()) {
      return number;
    } else {
      return number
          .toString()
          .replaceAll('1', '١')
          .replaceAll('2', '٢')
          .replaceAll('3', '٣')
          .replaceAll('4', '٤')
          .replaceAll('5', '٥')
          .replaceAll('6', '٦')
          .replaceAll('7', '٧')
          .replaceAll('8', '٨')
          .replaceAll('9', '٩')
          .replaceAll('0', '٠');
    }
  }

  getCurrentLangeName() {
    update();
    return currentLanguage == AppConstants.ENGLISH_LANGUAGE_CODE ? "English" : "Arabic";
  }

  @override
  onInit() {
    super.onInit();
    restoreLanguageCode();
  }

  //call from UI
  toggleLanguage() {
    if (currentLanguage == AppConstants.ENGLISH_LANGUAGE_CODE) {
      currentLanguage = AppConstants.ARABIC_LANGUAGE_CODE;
    } else {
      currentLanguage = AppConstants.ENGLISH_LANGUAGE_CODE;
    }

    changeLanguage(currentLanguage);
  }

  changeLanguage(String languageCode) {
    currentLanguage = languageCode;
    Get.updateLocale(Locale(languageCode));
    box.write("languageCode", languageCode);
    update();
  }

  String restoreLanguageCode() {
    final map = box.read('languageCode');
    print("map $map");
    if (map == null) {
      return AppConstants.ENGLISH_LANGUAGE_CODE;
    }
    currentLanguage = map;
    return map;
  }

//Storage services
  final box = GetStorage(AppConstants.STORAGE_NAME);

  Future<void> clear_storage() async {
    await box.erase();
  }

  Future<void> initStorage() async {
    isLoading = true;
    await GetStorage.init(AppConstants.STORAGE_NAME);
    restoreLanguageCode();
    isLoading = false;
  }
}