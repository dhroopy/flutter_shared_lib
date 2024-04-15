import 'dart:async';
import 'location_entity.dart';

/// This is an abstract class to get location related data,
/// Implement [LocationService] class, if you want to use
/// any location provider package like Geolocator or Location.
abstract class LocationService {
  ///params : void
  ///returns : [LocationEntity], or its subtypes [LocationInfo] to be precise.
  ///Retrieves the current location of user.
  Future<LocationEntity?> getCurrentLocation();

  ///params: void
  ///returns: [Steam] containing [LocationEntity]'s implementation
  ///gives continous location updates.
  Stream<LocationEntity?> getLocationUpdates();

  ///params: void
  ///returns: void
  ///disposes location updates.
  void disposeLocationUpdates();
}
