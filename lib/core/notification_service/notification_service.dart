abstract class NotificationService {
  Future<void> initNotificationService();

  void onMessage();

  void onBackgroundMessage();

  Future<String> getToken();
}
