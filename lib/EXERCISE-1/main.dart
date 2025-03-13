
import 'logger/console_logger.dart';
import 'models/ride_pre.dart';
import 'service/ride_pref_service.dart';
 
void main() {
  final service = RidePreferencesService();
  final logger = ConsoleLogger();

  service.addListener(logger); 

  service.setPreference(RidePreference(name: 'Kiminato')); 
  service.setPreference(RidePreference(name: 'Hello')); 

}

