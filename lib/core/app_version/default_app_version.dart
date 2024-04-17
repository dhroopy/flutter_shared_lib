import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_libs/core/app_version/app_version.dart';

class DefaultAppVersion extends AppVersion {
  @override
  Future<String> getAppVersion() async {
    String appVersion = "";
    final packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    return appVersion;
  }

  @override
  Future<int> getVersionCode() async {
    int versionCode = 0;
    final packageInfo = await PackageInfo.fromPlatform();
    versionCode = int.parse(packageInfo.buildNumber);
    return versionCode;
  }
}
