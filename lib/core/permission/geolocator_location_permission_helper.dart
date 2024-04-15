import 'package:geolocator/geolocator.dart';
import 'permission_enum.dart';
import 'permission_helper.dart';

///Implementation of [PermissionHelper] for Geolocator package.
class GeolocatorLocationPermissionHelper implements PermissionHelper {
  @override
  Future<PermissionEnum> checkPermission() async {
    LocationPermission result = await Geolocator.checkPermission();
    return _mapLocationPermissionToPermissionEnum(result);
  }

  @override
  Future<PermissionEnum> requestPermission() async {
    LocationPermission result = await Geolocator.requestPermission();
    return _mapLocationPermissionToPermissionEnum(result);
  }

  ///Helper method to convert the package's format to our app's format.
  ///this is private method, not allowed to used outside of this class.
  PermissionEnum _mapLocationPermissionToPermissionEnum(
      LocationPermission locPermission) {
    PermissionEnum permission;
    if (locPermission == LocationPermission.denied) {
      permission = PermissionEnum.denied;
    } else if (locPermission == LocationPermission.deniedForever) {
      permission = PermissionEnum.deniedForever;
    } else if (locPermission == LocationPermission.unableToDetermine) {
      permission = PermissionEnum.unableToDetermine;
    } else if (locPermission == LocationPermission.always) {
      permission = PermissionEnum.always;
    } else if (locPermission == LocationPermission.whileInUse) {
      permission = PermissionEnum.whileInUse;
    } else {
      permission = PermissionEnum.unableToDetermine;
    }
    return permission;
  }
}
