
///This class's scope is to handle GPS related functionality only
///Implement this abstract class, if you are using different gps service
///providers.
abstract class GpsService {

  ///params: void
  ///returns: boolean
  ///Checks if the GPS is enabled on the device or not.
  Future<bool> isGpsEnabled();

  ///params: void
  ///returns: void
  ///Implement this to ask/show user to enable gps.
  void enableGps();
  
}

