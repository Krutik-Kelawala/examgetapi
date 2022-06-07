import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:examgetapi/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';

class regpg extends StatefulWidget {
  @override
  _regpgState createState() => _regpgState();
}

class _regpgState extends State<regpg> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  bool nameerror = false;
  bool emailerror = false;
  bool passerror = false;
  String profileimg = "";
  final ImagePicker _picker = ImagePicker();
  Response? response;
  var dio = Dio();
  bool dataloadddd = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      dataloadddd = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return dataloadddd
        ? Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                      onTap: () async {
                        XFile? image;
                        image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          profileimg = image!.path;
                        });
                      },
                      child: Container(
                        child: profileimg == ""
                            ? Container(
                                child: Icon(
                                  Icons.person,
                                  size: 100,
                                ),
                              )
                            : Container(
                                child: CircleAvatar(
                                  maxRadius: 100,
                                  backgroundImage: FileImage(File(profileimg)),
                                ),
                              ),
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          nameerror = false;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "Name",
                          errorText: nameerror ? "Please fill this" : null,
                          hintText: "Enter your name here",
                          border: OutlineInputBorder()),
                      controller: name,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          emailerror = false;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "Email",
                          errorText: emailerror ? "Please fill this" : null,
                          hintText: "Enter your email here",
                          border: OutlineInputBorder()),
                      controller: email,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Phone No",
                          // errorText: nameerror ? "Please fill this" : null,
                          hintText: "Enter your no here (Optional)",
                          border: OutlineInputBorder()),
                      controller: mobile,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          passerror = false;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "Password",
                          errorText: passerror ? "Please fill this" : null,
                          hintText: "Enter your name here",
                          border: OutlineInputBorder()),
                      controller: password,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        String pname = name.text;
                        String pemail = email.text;
                        String pmobile = mobile.text;
                        String ppass = password.text;
                        List<int> iii = File(profileimg).readAsBytesSync();
                        String imgdata = base64Encode(iii);

                        Map regmap = {
                          "name": pname,
                          "mobile": pmobile,
                          "email": pemail,
                          "password": ppass,
                          "image": imgdata,
                        };

                        if (pname.isEmpty || pemail.isEmpty || ppass.isEmpty) {
                          setState(() {
                            nameerror = true;
                            emailerror = true;
                            passerror = true;
                          });
                        } else {
                          response = await dio.post(
                              'http://ukin.unitechitsolution.in/ukinbackup/AndroidClass/get_delivery_register.php',
                              data: regmap);

                          print("datalog  ==  ${response.toString()}");

                          var registrationnn = jsonDecode(response.toString());
                          myuserdata abc = myuserdata.fromJson(registrationnn);

                          if (abc.success == 2) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                  content: Text("Registartion Complete"),
                                  duration: Duration(seconds: 2),
                                ))
                                .closed
                                .whenComplete(() {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return loginpg();
                                },
                              ));
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Invalid User"),
                              duration: Duration(seconds: 2),
                            ));
                          }
                        }
                      },
                      child: Text("Registation")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Register ? "),
                      FlatButton(
                          onPressed: () {},
                          child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return loginpg();
                                  },
                                ));
                              },
                              child: Text("LogIn")))
                    ],
                  )
                ],
              )),
            ),
          )
        : Center(
            child: SpinKitFoldingCube(
            color: Colors.orangeAccent,
            size: 100,
          ));
  }
}

class myuserdata {
  int? success;

  myuserdata({this.success});

  myuserdata.fromJson(Map<String, dynamic> json) {
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}
