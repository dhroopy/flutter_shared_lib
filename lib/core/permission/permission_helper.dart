import 'permission_enum.dart';

/// abstract class to handle the different permission in the app.
abstract class PermissionHelper {
  const PermissionHelper();

  ///params: void
  ///returns: [PermissionEnum]
  ///check the status of the permission and returns it.
  Future<PermissionEnum> checkPermission();

  ///params: void
  ///returns: [PermissionEnum]
  ///requests the needed permission and returns the status of user.
  Future<PermissionEnum> requestPermission();
}
