import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:examgetapi/Registationpage.dart';
import 'package:examgetapi/hugeapilistpage.dart';
import 'package:examgetapi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loginpg extends StatefulWidget {
  @override
  _loginpgState createState() => _loginpgState();
}

class _loginpgState extends State<loginpg> {
  TextEditingController emailphone = TextEditingController();
  TextEditingController logpass = TextEditingController();
  bool emailmobileerror = false;
  bool passlogerror = false;
  bool loaddatascre = false;
  Response? response;
  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loaddatascre = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loaddatascre
        ? Scaffold(
            body: SafeArea(
                child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text("LogIn Here"),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        emailmobileerror = false;
                      });
                    },
                    decoration: InputDecoration(
                        errorText: emailmobileerror ? "Please fill this" : null,
                        label: Text("Username"),
                        hintText: "Enter Email or Phone number"),
                    controller: emailphone,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        passlogerror = false;
                      });
                    },
                    decoration: InputDecoration(
                        errorText: passlogerror ? "Please fill this" : null,
                        label: Text("Password"),
                        hintText: "Enter password "),
                    controller: logpass,
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      String logname = emailphone.text;
                      String logpassword = logpass.text;

                      Map maplog = {
                        "mo_no": logname,
                        "password": logpassword,
                      };

                      if (logname.isEmpty || logpassword.isEmpty) {
                        setState(() {
                          emailmobileerror = true;
                          passlogerror = true;
                        });
                      } else {
                        response = await dio.post(
                            'http://ukin.unitechitsolution.in/ukinbackup/AndroidClass/get_delivery_login.php',
                            data: maplog);

                        print("datalogin  ==  ${response.toString()}");
                        var logdataview = jsonDecode(response.toString());
                        mylogindata viewshow =
                            mylogindata.fromJson(logdataview);

                        if (viewshow.success == 1) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                                content: Text("Login Successfully !"),
                                duration: Duration(seconds: 2),
                              ))
                              .closed
                              .whenComplete(() {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return hugepg();
                              },
                            ));
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Error"),
                            duration: Duration(seconds: 2),
                          ));
                        }
                        String? personname = viewshow.name;
                        String? personmobile = viewshow.mobile;
                        String? personemail = viewshow.email;
                        String? personimg = viewshow.image;

                        homepage.preferences!.setBool("login", true);

                        homepage.preferences!.setString("name", personname!);
                        homepage.preferences!
                            .setString("mobileno", personmobile!);
                        homepage.preferences!.setString("mailid", personemail!);
                        homepage.preferences!.setString("imgaees", personimg!);
                      }
                    },
                    child: Text("LogIn")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New User ? "),
                    FlatButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return regpg();
                            },
                          ));
                        },
                        child: Text("Registation"))
                  ],
                )
              ],
            )),
          )
        : Center(
            child: SpinKitFoldingCube(
              size: 100,
              color: Colors.orangeAccent,
            ),
          );
  }
}

class mylogindata {
  int? success;
  String? id;
  String? type;
  String? name;
  String? mobile;
  String? email;
  String? password;
  String? image;
  String? deviceId;
  String? created;

  mylogindata(
      {this.success,
      this.id,
      this.type,
      this.name,
      this.mobile,
      this.email,
      this.password,
      this.image,
      this.deviceId,
      this.created});

  mylogindata.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    id = json['id'];
    type = json['type'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    deviceId = json['device_id'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['password'] = this.password;
    data['image'] = this.image;
    data['device_id'] = this.deviceId;
    data['created'] = this.created;
    return data;
  }
}
