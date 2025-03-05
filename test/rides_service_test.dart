

import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/mock/mock_rides_repository.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';

void main(){

 RidesService.initialize(MockRidesRepository());

  Location battambang = Location(name: "Battambang", country: Country.cambodia);
  Location siemReap = Location(name: "Siem Reap", country: Country.cambodia);

  // ride pref
  RidePreference prefTest1 = RidePreference(
    departure: battambang,
    arrival: siemReap,
    departureDate: DateTime.now(),
    requestedSeats: 1,
  );

  RidePreference prefTest2 = RidePreference(
    departure: battambang,
    arrival: siemReap,
    departureDate: DateTime.now(),
    requestedSeats: 1,
  );
  
   // Ride filter: pet allowed
  RidesFilter filter = RidesFilter(petAccepted: true);

  List<Ride> availableRides = RidesService.instance.getRidesFor(prefTest1, null);
  List<Ride> availableRidesWithPetAllowed = RidesService.instance.getRidesFor(prefTest2, filter);

  print(availableRides);
  print(availableRidesWithPetAllowed);
}