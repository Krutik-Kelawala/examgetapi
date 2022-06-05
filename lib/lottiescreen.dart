import 'package:examgetapi/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class lottiepage extends StatefulWidget {
  @override
  _lottiepageState createState() => _lottiepageState();
}

class _lottiepageState extends State<lottiepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 10)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return homepage();
        },
      ));
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
