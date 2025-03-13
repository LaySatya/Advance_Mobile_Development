import 'logger/console_logger.dart';
import 'models/ride_pre.dart';
import 'service/ride_pref_service.dart';

void main() {
  RidePreferencesService ridePreferencesService = RidePreferencesService();
  ConsoleLogger consoleLogger = ConsoleLogger();

  // Register ConsoleLogger as a listener
  ridePreferencesService.addListener(consoleLogger);

  // Simulate a preference change
  ridePreferencesService.setPreference(RidePreference.defaultPreference);

}
