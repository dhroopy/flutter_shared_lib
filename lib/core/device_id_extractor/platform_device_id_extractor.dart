import 'package:flutter/services.dart';
import 'package:platform_device_id/platform_device_id.dart';

import 'device_id_extractor.dart';

class PlatformDeviceIdExtractor extends DeviceIdExtractor {
  @override
  Future<String?> extractDeviceId() async {
    try {
      return await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      return "";
    }
  }
}