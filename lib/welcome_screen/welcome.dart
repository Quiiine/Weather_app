import 'package:flutter/material.dart';
import '../screen2(0)/screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, String url) async {
  try {
    await launch(url);
  } on PlatformException catch (e) {
    if (e.code == 'url_launcher_error') {
      // Handle the error gracefully
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to launch the URL.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}



final customFont = Future(() {
  return rootBundle.load('assets/SairaCondensed-ExtraLight.ttf');
});

TextStyle customTextStyle = TextStyle(
  fontFamily: 'assets/SairaCondensed-ExtraLight.ttf',
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Screen',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.green,
      ),
      home: WelcomeScreen(),
      routes: {
        '/screen1': (context) => WelcomeScreen(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB388FF),
        centerTitle: true,
        leading: null,
        title: const Text('Weather App',style: TextStyle( fontFamily:'assets/SairaCondensed-ExtraLight.ttf')),
      ),
      body: Container(
          decoration: BoxDecoration(
          gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
          Color(0xFF2433BC),
          Color(0xFF646CB2),
          ],
          ),),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              height: 140,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Color(0xFFB388FF),
                fixedSize: (Size(280, 40)),
              ),
              child: Text(
                'Current location weather',
                style: customTextStyle,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                launchURL(context, 'https://velialgui.github.io/index.html');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Color(0xFFB388FF),
                fixedSize: (Size(200, 20)),
              ),
              child: Text('Our Website',style: customTextStyle),
            ),
            SizedBox(
              width: 20,
              height: 90,
            ),
            Container(
              child: Image.asset(
                'assets/Screenshot 2023-06-15 at 00.42.19.png',
            ),
            ),
          ],
        ),
      ),
    );
  }
}
