import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

import 'gps_service.dart';

class GeolocatorGpsService implements GpsService {
  @override
  void enableGps() {
    debugPrint("Please enable Gps");
  }

  @override
  Future<bool> isGpsEnabled() async {
      return  await Geolocator.isLocationServiceEnabled();
  }
}
