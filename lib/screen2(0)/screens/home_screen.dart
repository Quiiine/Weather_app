import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_status/screen2(0)/controller/global_controller.dart';
import 'package:sky_status/screen2(0)/widgets/current_weather_widget.dart';
import 'package:sky_status/screen2(0)/widgets/header_widget.dart';
import '../../main.dart';
import '../../welcome_screen/welcome.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> updateData() async {
    setState(() {
      globalController.isLoading.value = true; // Show loading indicator
    });

    await globalController.getLocation();

    setState(() {
      globalController.isLoading.value = false; // Hide loading indicator
    });
  }
  // call
  final GlobalController globalController =
  Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Color(0xFFB388FF),
        ),
      ),
        leading: Container(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: Image.asset(
                'assets/Screenshot 2023-06-15 at 06.44.13.png',
                width: 15,
                height: 15,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(
            'assets/Screenshot 2023-06-15 at 00.42.19.png',
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/64665.png',
            ),
            iconSize: 49,
            onPressed: () async {
              clearAppHash();
              clearAppStorage();

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 20),
                        Text('Updating data...'),
                      ],
                    ),
                  );
                },
              );

              await updateData();

              Navigator.pop(context); // Close the loading dialog

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),

        ],
      ),
      backgroundColor:  const Color(0xFF6B79E3),
      body: Container(padding: EdgeInsets.symmetric(horizontal: 9),child:SafeArea(

        child: Obx(() => globalController.checkLoading().isTrue
            ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomLoadingIndicator(),
                CircularProgressIndicator(),
              ],
            ))
            : Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 340,
                height: 600,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF2433BC),
                      Color(0xFF646CB2),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                  HeaderWidget(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: CurrentWeatherWidget(
                        weatherDataCurrent: globalController.getData().getCurrentWeather(),
                      ),
                    ),
                  ],),
              ),

              SizedBox(
                height: 20,
              ),

            ],
          ),
        )),
      ),
      ),
    );
  }
}
class CustomLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Stack(
          children: [

            Center(
              child: Image.asset(
                'assets/icon.png', // Replace with the path to your custom image
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
