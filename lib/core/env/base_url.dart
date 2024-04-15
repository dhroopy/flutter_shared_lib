abstract class BaseUrl {
  const BaseUrl();

  String getBaseUrl();
}

class WeatherApiBaseUrl extends BaseUrl {
  const WeatherApiBaseUrl();
  
  @override
  String getBaseUrl() {
    return "https://api.tomorrow.io/v4/weather/";
  }
}
