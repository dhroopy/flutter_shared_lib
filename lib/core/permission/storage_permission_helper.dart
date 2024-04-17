import 'package:permission_handler/permission_handler.dart';
import 'package:shared_libs/core/permission/permission_enum.dart';
import 'package:shared_libs/core/permission/permission_helper.dart';

class StoragePermissionHelper extends PermissionHelper {
  @override
  Future<PermissionEnum> checkPermission() async {
    bool hasPermission = await Permission.storage.isGranted;
    if (hasPermission) {
      return PermissionEnum.always;
    }
    return PermissionEnum.denied;
  }

  @override
  Future<PermissionEnum> requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status == PermissionStatus.denied) {
      return PermissionEnum.denied;
    } else if (status == PermissionStatus.permanentlyDenied) {
      return PermissionEnum.deniedForever;
    } else if (status == PermissionStatus.granted) {
      return PermissionEnum.always;
    } else {
      return PermissionEnum.unableToDetermine;
    }
  }
}
