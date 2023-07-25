import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_status/screen2(0)/controller/global_controller.dart';
import 'package:sky_status/screen2(0)/screens/home_screen.dart';
import 'package:sky_status/screen2(0)/widgets/daily_data_forecast.dart';
import 'package:sky_status/screen2(0)/widgets/header_widget.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);


  @override
  State<Screen3> createState() => Screen3State();
}

class Screen3State extends State<Screen3> {
  Future<void> updateData() async {
    setState(() {
      globalController.isLoading.value = true;
    });

    await globalController.getLocation();

    setState(() {
      globalController.isLoading.value = false;
    });
  }
  // call
  final GlobalController globalController =
  Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB388FF),
        leading: IconButton(
          icon: Image.asset(
            'assets/Screenshot 2023-06-15 at 06.44.13.png',
          ),
          iconSize: 49,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        centerTitle: true,
        title: SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(
          'assets/Screenshot 2023-06-15 at 00.42.19.png',
          width: 100,
          height: 102,
        ),),
      ),
      backgroundColor: const Color(0xFFB388FF),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Container(
                  width: 349,
                  height: 209,
                  margin: const EdgeInsets.fromLTRB(30,30, 30, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF2433BC),
                        Color(0xFF646CB2),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      const HeaderWidget(),
                    ],

                  ),
                ),
                DailyDataForecast(
                  weatherDataDaily: globalController.getData().getDailyWeather(),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
Container createObjectWithButtonAndLogo(BuildContext context) {
  return Container(
    child: Row(
      children: [
        IconButton(
          icon: Image.asset(
            'assets/Screenshot 2023-06-15 at 06.44.13.png',
          ),
          iconSize: 49,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.48,
        ),
        Image.asset(
          'assets/Screenshot 2023-06-15 at 00.42.19.png',
          width: 100,
          height: 62,
        ),
      ],
    ),
  );
}


