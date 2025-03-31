


import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/model/user/user.dart';
import 'package:week_3_blabla_project/repository/ride_repository.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';

class MockRidesRepository extends RidesRepository {
  
  final List<Ride> _allRides = fakeRides;
  MockRidesRepository() {
    
    User pich = User(firstName: "Pich", lastName: "Sok", email: "" , phone: "", profilePicture: "" , verifiedProfile: true);
    User vath = User(firstName: "Vath", lastName: "Sok", email: "chaylim", phone: "0123456789", profilePicture: "" , verifiedProfile: true);


    Location battambang =
        Location(name: "Battambang", country: Country.cambodia);
    Location siemReap = Location(name: "Siem Reap", country: Country.cambodia);

    Ride ride1 = Ride(
        departureLocation: battambang,
        departureDate: DateTime.now().copyWith(hour: 08, minute: 30),
        arrivalLocation: siemReap,
        arrivalDateTime: DateTime.now().copyWith(hour: 23, minute: 30),
        driver: pich,
        availableSeats: 2,
        pricePerSeat: 10);

    Ride ride2 = Ride(
        departureLocation: battambang,
        departureDate: DateTime.now().copyWith(hour: 21, minute: 00),
        arrivalLocation: siemReap,
        arrivalDateTime: DateTime.now().copyWith(hour: 24, minute: 00),
        driver: vath,
        availableSeats: 0,
        pricePerSeat: 10);

    _allRides.addAll([ride1, ride2]);
  }

   @override
  List<Ride> getRides(RidePreference prefs, RidesFilter? filter) {
    return _allRides
        .where((ride) =>
            ride.departureLocation == prefs.departure &&
            ride.arrivalLocation == prefs.arrival &&
            ride.availableSeats > 0)
        .toList();
  }

}