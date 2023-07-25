import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sky_status/screen2(0)/controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 400,
          height: 85,
          decoration: BoxDecoration(
              color: Color(0xFFA39FED),
            borderRadius: BorderRadius.circular(45)

          ),
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topCenter,
          child: Text(
            city,
            style: const TextStyle(fontFamily:  'SairaCondensed-ExtraLight', fontSize: 31, height: 2,
            color: Colors.white),
          ),
        ),

        SizedBox(height: 14,),
        Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
          gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
              Color(0xFF2433BC),
              Color(0xFF646CB2),
            ],
          ),
          borderRadius: BorderRadius.circular(45)
         ),
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20,
          top: 5),
          alignment: Alignment.topCenter,
          child: Text(
            date,
            style:
                const TextStyle(fontSize: 25, color: Colors.white, height: 1.5),
          ),
        ),
      ],
    );
  }
}
