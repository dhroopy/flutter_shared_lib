import 'location_entity.dart';

abstract class GeocodingService {
  Future<String> decodeLatLng(LocationEntity? location);

  Future<LocationEntity?>? decodeStringLocation(String? location);
}
