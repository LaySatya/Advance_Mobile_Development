


import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/ride_repository.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';

class MockRidesRepository extends RidesRepository {
  
  final List<Ride> _allRides = fakeRides;

   @override
  List<Ride> getRides(RidePreference prefs, RidesFilter? filter) {
    return _allRides
        .where((ride) =>

            // Filter on departure / arrival
            ride.departureLocation == prefs.departure &&
            ride.arrivalLocation == prefs.arrival &&

            // Filter on pets if required
            // (filter != null && filter.onlyPets ? ride.acceptPets : true) &&

            // Filter on rides with available seat only
            ride.availableSeats > 0)
        .toList();
  }

}