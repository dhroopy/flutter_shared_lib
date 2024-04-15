import 'dart:async';
import 'package:geolocator/geolocator.dart';

import '../gps/gps_service.dart';
import '../permission/permission_enum.dart';
import '../permission/permission_helper.dart';
import 'location_entity.dart';
import 'location_service.dart';

///Implementation of [LocationService] for Geolocator package.
class GeolocatorLocationService implements LocationService {
  ///requires implementation of [GpsService] like
  ///implementation of [GeolocatorGpsService]
  GpsService gpsService;

  ///requires implementation of [PermissionHelper]
  ///in this case [GeolocatorPermissionHelper]
  PermissionHelper permissionHelper;

  ///Dependency Injection.
  GeolocatorLocationService(
      {required this.gpsService, required this.permissionHelper});

  ///Streams to handle location updates
  StreamController<LocationEntity?>? _locationController;
  StreamSubscription<Position?>? _positionSubscription;

  @override
  Future<LocationEntity?> getCurrentLocation() async {
    LocationEntity? location;

    /// 1. Check permission first
    PermissionEnum result = await permissionHelper.checkPermission();
    if (_isPermissionGranted(result)) {
      /// 3. Check if gps is enabled
      if (await gpsService.isGpsEnabled()) {
        /// 5. get location
        Position position = await Geolocator.getCurrentPosition();
        location = LocationInfo(
            latitude: position.latitude,
            longitude: position.longitude,
            accuracy: position.accuracy,
            altitude: position.altitude);
      } else {
        /// 4. if not then ask to enable
        gpsService.enableGps();
      }
    } else {
      /// 2. if not granted request
      PermissionEnum result = await permissionHelper.requestPermission();
      if (_isPermissionGranted(result)) {
        location = await getCurrentLocation();
      }
    }
    return location;
  }

  @override
  Stream<LocationEntity?> getLocationUpdates() {
    _locationController = StreamController<LocationEntity?>();
    _positionSubscription =
        Geolocator.getPositionStream().listen((Position? position) {
      if (position != null) {
        LocationEntity location = LocationInfo(
          latitude: position.latitude,
          longitude: position.longitude,
          accuracy: position.accuracy,
          altitude: position.altitude,
        );
        _locationController!.add(location);
      } else {
        _locationController!.add(null);
      }
    });
    return _locationController!.stream;
  }

  @override
  void disposeLocationUpdates() {
    if (_locationController != null) {
      _locationController!.close();
    }

    if (_positionSubscription != null) {
      _positionSubscription!.cancel();
    }
  }

  ///Helper method with scope within this class only.
  bool _isPermissionGranted(PermissionEnum result) {
    return result == PermissionEnum.always ||
        result == PermissionEnum.whileInUse;
  }
}
