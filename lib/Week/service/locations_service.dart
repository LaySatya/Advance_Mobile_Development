import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/repository/locations_repository.dart';

import '../dummy_data/dummy_data.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {

  static const List<Location> availableLocations = fakeLocations; 

  static LocationsService? _instance;

  final LocationsRespository repository;
  List<Location> _locations = [];

  /// Private constructor
  LocationsService._internal(this.repository) {
    _locations = repository.getLocations();
  }

  /// Initialize with a repository
  static void initialize(LocationsRespository repository) {
    if (_instance == null) {
      _instance = LocationsService._internal(repository);
    } else {
      throw Exception("LocationService is already initialized.");
    }
  }

  /// Singleton accessor
  static LocationsService get instance {
    if (_instance == null) {
      throw Exception("LocationService is not initialized. Call initialize() first.");
    }
    return _instance!;
  }

  /// Fetch locations
  List<Location> getLocations() {
    return _locations;
  }
  
  List<Location> getLocationsFor(String text) {
    return repository
        .getLocations()
        .where((location) =>
            location.name.toUpperCase().contains(text.toUpperCase()))
        .toList();
  }
}

