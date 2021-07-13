import 'package:flutter/material.dart';
import 'package:zignut_practicle/constants/app_constants.dart';
import 'package:zignut_practicle/screens/dashboard_screen.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  navigationMethod() async {
    if(AppConstants.prefs.getBool('ISLoggedIn') == true){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {

      navigationMethod();

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/Splash/Android/bg.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.75,
                    width: MediaQuery.of(context).size.height / 1.75,
                    child: Image.asset('assets/Splash/Android/logo.png')),
              ))
        ],
      ),
    );
  }
}
