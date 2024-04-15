/// Represent the possible location permissions.
enum PermissionEnum {
  /// Permission is denied
  denied,

  /// Permission is permenantly denied.
  deniedForever,

  /// Permission is allowed only while the App is in use.
  whileInUse,

  /// Permission is allowed even when the App is running in the background.
  always,

  /// Permission status is cannot be determined.
  unableToDetermine
}
