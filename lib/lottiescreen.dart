import 'package:examgetapi/loginpage.dart';
import 'package:examgetapi/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class lottiepage extends StatefulWidget {
  @override
  _lottiepageState createState() => _lottiepageState();
}

class _lottiepageState extends State<lottiepage> {
  bool loginstatuss = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getviewss();
  }

  getviewss() async {
    homepage.preferences = await SharedPreferences.getInstance();
    setState(() {
      loginstatuss = homepage.preferences!.getBool("login") ?? false;
    });

    Future.delayed(Duration(seconds: 10)).then((value) {
      if (loginstatuss) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return homepage();
          },
        ));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return loginpg();
          },
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            child: Lottie.asset("lottie/l2.json", fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
