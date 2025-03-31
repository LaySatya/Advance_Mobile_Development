
import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/repository/locations_repository.dart';

class MockLocationsRepository extends LocationsRespository {
  final List<Location> _locations = fakeLocations;

  @override
  List<Location> getLocations() {
    return _locations;
  }

  @override 
  void addLocation(Location location) {
    _locations.add(location);
  }
}