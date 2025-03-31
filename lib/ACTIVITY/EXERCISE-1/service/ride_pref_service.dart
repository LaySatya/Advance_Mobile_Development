import '../models/ride_pre.dart';
import 'ride_pref_listener.dart';

class RidePreferencesService {
  RidePreference? _newPreference;
  final List<RidePreferencesListener> _listeners = [];
  
  void addListener(RidePreferencesListener listener) {
    _listeners.add(listener);
  }

  void setPreference(RidePreference preference) {
    _newPreference = preference;
    notifyListeners();
  }
  
  void removeListener(RidePreferencesListener listener) {
    _listeners.remove(listener);
  }
  
  void notifyListeners() {
    if (_listeners.isEmpty){
      print(" No listeners!");
    }

    for (var listener in _listeners) {
      print(" Notifying listener: $listener");
      listener.onPreferenceChange(_newPreference!);
    }
  }
}