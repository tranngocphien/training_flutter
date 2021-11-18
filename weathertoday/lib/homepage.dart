import 'package:flutter/material.dart';
import 'package:weathertoday/api.dart';
import 'package:weathertoday/models/weather.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<WeatherToday> futureWeather;

  @override
  void initState() {
    futureWeather = WeatherAPI("Hanoi").getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<WeatherToday>(
            future: futureWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Weather(weatherToday: snapshot.data!);
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

class Weather extends StatelessWidget {
  const Weather({
    Key? key,
    required this.weatherToday,
  }) : super(key: key);

  final WeatherToday weatherToday;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/cloud.jpg"),
          fit: BoxFit.cover

        )
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32,),
            Text(weatherToday.name, style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),),
            Text(weatherToday.weather_main,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500
              ),
            ),
            Text(weatherToday.temp.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("C:${weatherToday.temp_max}"),
                SizedBox(width: 8,),
                Text("T:${weatherToday.temp_min}")
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Divider(thickness: 1,),
            Row(
              children: [
                Tile(label: "MT MỌC", value: weatherToday.sunrise.toString(),),
                Tile(label: "MT LẶN", value: weatherToday.sunset.toString(),)
              ],
            ),
            Divider(thickness: 1,),
            Row(
              children: [
                Tile(label: "ĐỘ ẨM", value: weatherToday.humidity.toString(),),
                Tile(label: "NHIỆT ĐỘ CẢM NHẬN", value: weatherToday.feels_like.toString(),)
              ],
            ),
            Divider(thickness: 1,),
            Row(
              children: [
                Tile(label: "ÁP SUẤT", value: weatherToday.pressure.toString(),),
                Tile(label: "CÓ MÂY", value: weatherToday.clouds.toString() + "%",)
              ],
            ),
            Divider(thickness: 1,),
            Row(
              children: [
                Tile(label: "TỐC ĐỘ GIÓ", value: weatherToday.wind_speed.toString(),),
                Tile(label: "HƯỚNG GIÓ", value: weatherToday.wind_deg.toString(),)
              ],
            ),
            Divider(thickness: 1,),
            Row(
              children: [
                Tile(label: "TẦM NHÌN XA", value: weatherToday.visibility.toString() +"m",),
                Tile(label: "LAST UPDATE", value: weatherToday.dt.toString(),)
              ],
            ),
            Divider(thickness: 1,),
            

          ],
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final String label;
  final String value;
  const Tile({
    Key? key, required this.label, required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
              style: TextStyle(
                fontSize: 16
              ),
            ),
            Text(value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400
              ),
            )
          ],
        )
    );
  }
}
