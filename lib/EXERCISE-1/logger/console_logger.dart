import '../models/ride_pre.dart';
import '../service/ride_pref_listener.dart';

class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceChange(RidePreference changedPreference) {
    print('Preference changed: ${changedPreference.toString()}');
  }
}