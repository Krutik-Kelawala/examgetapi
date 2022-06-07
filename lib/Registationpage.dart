import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () async {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
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
                    nameerror = true;
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
                    emailerror = true;
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
                    passerror = true;
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
                        'http://ukin.unitechitsolution.in/ukinbackup/AndroidClass/get_delivery_login.php',
                        data: regmap);

                    print("datalog  ==  ${response.toString()}");

                    var registrationnn = jsonDecode(response.toString());
                    myregdata abc = myregdata.fromJson(registrationnn);

                    if (abc.success == 2) {
                      ScaffoldMessenger(
                          child: SnackBar(
                        content: Text("Registation Complete"),
                        duration: Duration(seconds: 2),
                      ));
                    } else {
                      ScaffoldMessenger(
                          child: SnackBar(
                        content: Text("Invalid data"),
                        duration: Duration(seconds: 3),
                      ));
                    }
                  }
                },
                child: Text("Registation")),
            Row(
              children: [
                Text("Already Register ? "),
                FlatButton(
                    onPressed: () {},
                    child: InkWell(onTap: () {}, child: Text("LogIn")))
              ],
            )
          ],
        )),
      ),
    );
  }
}

class myregdata {
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

  myregdata(
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

  myregdata.fromJson(Map<String, dynamic> json) {
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
