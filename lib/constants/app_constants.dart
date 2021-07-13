import 'package:shared_preferences/shared_preferences.dart';

class AppConstants {
  static SharedPreferences prefs;
  static Duration TIMEOUT_DURATIOnN = Duration(seconds: 10);
  static Map<String, String> AUTHORIZATION_HEADER = {
    "Content-Type" : "application/x-www-form-urlencoded"
  };

}

extension IntegerExtension on int {
  bool isBetween(int lowerBound, int upperBound,
      {bool excludeEndPoints = false}) {
    return excludeEndPoints == false
        ? (this >= lowerBound && this <= upperBound)
        : (this > lowerBound && this < upperBound);
  }
}
