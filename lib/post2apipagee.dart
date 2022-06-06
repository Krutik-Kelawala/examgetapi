import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:examgetapi/hugeapilistpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class post2apipg extends StatefulWidget {
  @override
  _post2apipgState createState() => _post2apipgState();
}

class _post2apipgState extends State<post2apipg> {
  var dataallget;
  bool loadst = false;
  post2dataclass? getviewload;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    get2postapidata();
  }

  get2postapidata() async {
    var response = await Dio().get('https://invicainfotech.com/apicall/mydata');
    print(response.toString());

    dataallget = jsonDecode(response.toString());
    setState(() {
      getviewload = post2dataclass.fromJson(dataallget);
      loadst = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double theheight = MediaQuery.of(context).size.height;
    double thewidth = MediaQuery.of(context).size.width;
    double theststuabar = MediaQuery.of(context).padding.top;
    double thenavigator = MediaQuery.of(context).padding.bottom;
    double theappbar = kToolbarHeight;
    double the_bodyheight = theheight - theststuabar - theappbar - thenavigator;
    return loadst
        ? Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              label: Text("Next"),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return hugepg();
                  },
                ));
              },
            ),
            appBar: AppBar(
              title: Text("infotech Contact"),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: getviewload!.contacts!.length,
              itemBuilder: (context, index) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.all(the_bodyheight * 0.01),
                    padding: EdgeInsets.all(the_bodyheight * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        border: Border.all(width: 1)),
                    child: Column(
                      children: [
                        Text(
                          "Id : ${getviewload!.contacts![index].id}",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Container(
                              // margin: EdgeInsets.all(the_bodyheight * 0.02),
                              height: the_bodyheight * 0.25,
                              width: thewidth * 0.3,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${getviewload!.contacts![index].userimage}"))),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: thewidth * 0.03),
                              // height: the_bodyheight * 0.3,
                              // width: thewidth * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Name : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: the_bodyheight * 0.02),
                                      ),
                                      Container(
                                        child: Text(
                                          "${getviewload!.contacts![index].name}",
                                          style: TextStyle(
                                              fontSize: the_bodyheight * 0.02),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Email : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: the_bodyheight * 0.02),
                                      ),
                                      Text(
                                        "${getviewload!.contacts![index].email}",
                                        style: TextStyle(
                                            fontSize: the_bodyheight * 0.02),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "Address : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: the_bodyheight * 0.02),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "${getviewload!.contacts![index].address}",
                                          style: TextStyle(
                                              fontSize: the_bodyheight * 0.02),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                              children: [
                                            TextSpan(
                                                text: "Male",
                                                style: getviewload!
                                                            .contacts![index]
                                                            .gender ==
                                                        "male"
                                                    ? TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize:
                                                            the_bodyheight *
                                                                0.02)
                                                    : null),
                                            TextSpan(
                                              text: " / ",
                                            ),
                                            TextSpan(
                                                text: "Female",
                                                style: getviewload!
                                                            .contacts![index]
                                                            .gender ==
                                                        "female"
                                                    ? TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            the_bodyheight *
                                                                0.02)
                                                    : null),
                                          ],
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "Phone : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: the_bodyheight * 0.02),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\t\tMobile : ${getviewload!.contacts![index].phone!.mobile}",
                                        style: TextStyle(
                                            fontSize: the_bodyheight * 0.02),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\t\tHome : ${getviewload!.contacts![index].phone!.home}",
                                        style: TextStyle(
                                            fontSize: the_bodyheight * 0.02),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              getviewload!.contacts!.removeAt(index);
                            });
                          },
                          child: Container(
                            child: Center(
                                child: Text(
                              "Remove",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  color: Colors.white),
                            )),
                            height: the_bodyheight * 0.06,
                            width: thewidth,
                            decoration: BoxDecoration(color: Colors.redAccent),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Center(
            child: SpinKitFoldingCube(
            color: Colors.orangeAccent,
            size: the_bodyheight * 0.2,
          ));
  }
}

class post2dataclass {
  List<Contacts>? contacts;

  post2dataclass({this.contacts});

  post2dataclass.fromJson(Map<String, dynamic> json) {
    if (json['contacts'] != null) {
      contacts = <Contacts>[];
      json['contacts'].forEach((v) {
        contacts!.add(new Contacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contacts != null) {
      data['contacts'] = this.contacts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contacts {
  String? id;
  String? name;
  String? email;
  String? userimage;
  String? address;
  String? gender;
  Phone? phone;

  Contacts(
      {this.id,
      this.name,
      this.email,
      this.userimage,
      this.address,
      this.gender,
      this.phone});

  Contacts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    userimage = json['userimage'];
    address = json['address'];
    gender = json['gender'];
    phone = json['phone'] != null ? new Phone.fromJson(json['phone']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['userimage'] = this.userimage;
    data['address'] = this.address;
    data['gender'] = this.gender;
    if (this.phone != null) {
      data['phone'] = this.phone!.toJson();
    }
    return data;
  }
}

class Phone {
  String? mobile;
  String? home;

  Phone({this.mobile, this.home});

  Phone.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    home = json['home'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['home'] = this.home;
    return data;
  }
}
