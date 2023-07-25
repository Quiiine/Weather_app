import 'package:flutter/material.dart';
import 'package:sky_status/screen2(0)/model/weather_data_current.dart';
import 'package:sky_status/screen2(0)/utils/custom_colors.dart';
import 'package:sky_status/welcome_screen/zxc.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //tempeture area

        Container(
          width: 400,
          height: 150,
          decoration: BoxDecoration(
              color: Color(0xFFA39FED),
              borderRadius: BorderRadius.circular(45)),
          child: tempeatureAreaWidget(),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen3()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(43),
                ),
                backgroundColor:  Color(0xFF2433BC),
              ),
              child: Text(
                '7 Days Forecast >',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'SairaCondensed-ExtraLight',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),


        Container(
            width: 400,
            height: 135,
            decoration: BoxDecoration(
            gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
            Color(0xFF2433BC),
            Color(0xFF646CB2),
            ],
            ),
            borderRadius: BorderRadius.circular(45)),
              child: currentWeatherMoreDetailsWidget(),
        ),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 70,
              width: 70,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height: 70,
              width: 70,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: 70,
              width: 70,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/humidity.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 40,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.windSpeed}km/h",
                style: const TextStyle(fontSize: 19,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.clouds}%",
                style: const TextStyle(fontSize: 19,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.humidity}%",
                style: const TextStyle(fontSize: 19,
                color: Colors.white),

                textAlign: TextAlign.center,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget tempeatureAreaWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 1,
            color: CustomColors.dividerLine,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: RichText(
                  text: TextSpan(
                    text: "${weatherDataCurrent.current.weather![0].description}".toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 1,
            color: CustomColors.dividerLine,
          ),
          SizedBox(width: 5,),
          Expanded(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "${weatherDataCurrent.current.temp!.toInt()}°",
                  style: const TextStyle(
                    fontSize: 59,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SairaCondensed-ExtraLight',
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

}
