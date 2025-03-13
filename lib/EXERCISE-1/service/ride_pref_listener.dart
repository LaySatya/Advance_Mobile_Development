import '../models/ride_pre.dart';


abstract class RidePreferencesListener {
  void onPreferenceChange(RidePreference changedPreference);
}