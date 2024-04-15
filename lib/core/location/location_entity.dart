///Abstract class for to handle the data related to location
abstract class LocationEntity {
  double? latitude;
  double? longitude;
  double? accuracy;
  double? altitude;

  String? address;

  LocationEntity(
      {this.latitude,
      this.longitude,
      this.accuracy,
      this.altitude,
      this.address});

  @override
  String toString() {
    return "latitude: $latitude, longitude: $longitude, accuracy: $accuracy, altitude: $altitude, address: $address ";
  }

  LocationEntity fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}

///Implementation for LocationEntity
///[LocationInfo] is actually used to store the data.
class LocationInfo extends LocationEntity {
  LocationInfo(
      {super.latitude,
      super.longitude,
      super.accuracy,
      super.altitude,
      super.address});

  @override
  LocationEntity fromJson(Map<String, dynamic> json) {
    return LocationInfo(
        latitude: json["lat"]?.toDouble(),
        longitude: json["lon"]?.toDouble(),
        address: json["name"]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
