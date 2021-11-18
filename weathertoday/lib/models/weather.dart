class WeatherToday {
  String name;
  String weather_main;
  String weather_description;
  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
  int pressure;
  int humidity;
  int sea_level;
  int grnd_level;
  int visibility;
  double wind_speed;
  int wind_deg;
  double wind_gust;
  int clouds;
  int dt;
  int sunrise;
  int sunset;

  WeatherToday({
      required this.name,
      required this.weather_main,
      required this.weather_description,
      required this.temp,
      required this.feels_like,
      required this.temp_min,
      required this.temp_max,
      required this.pressure,
      required this.humidity,
      required this.sea_level,
      required this.grnd_level,
      required this.visibility,
      required this.wind_speed,
      required this.wind_deg,
      required this.wind_gust,
      required this.clouds,
      required this.dt,
      required this.sunrise,
      required this.sunset});

  factory WeatherToday.fromJson(Map<String, dynamic> json){
    return WeatherToday(
        name: json["name"],
        weather_main: json["weather"][0]["main"],
        weather_description: json["weather"][0]["description"],
        temp: (json["main"]["temp"] - 273.15),
        feels_like: (json["main"]["feels_like"] - 273.15),
        temp_min: (json["main"]["temp_min"] - 273.15),
        temp_max: (json["main"]["temp_max"] - 273.15),
        pressure: json["main"]["pressure"],
        humidity: json["main"]["humidity"],
        sea_level: json["main"]["sea_level"],
        grnd_level: json["main"]["grnd_level"],
        visibility: json["visibility"],
        wind_speed: json["wind"]["speed"],
        wind_deg: json["wind"]["deg"],
        wind_gust: json["wind"]["gust"],
        clouds: json["clouds"]["all"],
        dt: json["dt"],
        sunrise: json["sys"]["sunrise"],
        sunset: json["sys"]["sunset"]);
  }
}
