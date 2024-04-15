import 'package:geocoding/geocoding.dart';

import '../validator/validator.dart';
import 'geocoding_service.dart';
import 'location_entity.dart';

class GeocodingServiceImpl extends GeocodingService {
  late Validator validator;

  @override
  Future<String> decodeLatLng(LocationEntity? location) async {
    String address = "";
    try {
      if (location == null) {
        return address;
      }
      List<Placemark> placemarks = await placemarkFromCoordinates(
          location.latitude!, location.longitude!);

      if (placemarks.isEmpty) {
        return address;
      }

      validator = StringValidator(text: placemarks.first.subLocality);
      if (validator.isValid()) {
        address = "$address${placemarks.first.subLocality}, ";
      }

      validator = StringValidator(text: placemarks.first.locality);
      if (validator.isValid()) {
        address = "$address ${placemarks.first.locality}";
      }
    } catch (e) {
      return address;
    }
    return address;
  }

  @override
  Future<LocationEntity?>? decodeStringLocation(String? location) {
    return null;
  }
}
