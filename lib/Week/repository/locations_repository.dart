import 'package:week_3_blabla_project/model/ride/locations.dart';

abstract class LocationsRespository {
  List<Location> getLocations();

  void addLocation(Location location);
}