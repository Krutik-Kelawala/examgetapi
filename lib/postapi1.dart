import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:examgetapi/post2apipagee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class postapi1page extends StatefulWidget {
  @override
  _postapi1pageState createState() => _postapi1pageState();
}

class _postapi1pageState extends State<postapi1page> {
  Response? response;
  var dio = Dio();
  getvalueapipost? appdata;
  var mydataaaa;
  bool okstatus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getapipostm();
  }

  getapipostm() async {
    response = await dio.post('https://test.technofox.co.in/easy-app/api/login',
        data: {"email": 'pradosh.son2ic2@gmail.com', "password": 123456});

    print("datttaa == ${response.toString()}");

    var mydataaaa = jsonDecode(response.toString());
    setState(() {
      appdata = getvalueapipost.fromJson(mydataaaa);
      okstatus = true;
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
    return okstatus
        ? Scaffold(
            appBar: AppBar(
              title: Text("Post Api 1"),
              centerTitle: true,
            ),
            body: Container(
              padding: EdgeInsets.all(the_bodyheight * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Success : ${appdata!.success}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: the_bodyheight * 0.02),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Id : ",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${appdata!.data!.id}",
                          style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Type : ",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${appdata!.data!.type}",
                          style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "User type : ",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${appdata!.data!.userType}",
                          style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Name : ",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${appdata!.data!.name}",
                          style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "First name : ",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${appdata!.data!.firstName}",
                          style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Last name : ",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${appdata!.data!.lastName}",
                          style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Email : ",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${appdata!.data!.email}",
                          style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Phone : ",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${appdata!.data!.phone}",
                          style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "OTP : ",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${appdata!.data!.otp}",
                          style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Is Verified : ",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${appdata!.data!.isVerified}",
                          style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Api token : ",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            "${appdata!.data!.apiToken}",
                            style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Dob : ",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${appdata!.data!.dob}",
                          style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Create AT : ",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${appdata!.data!.createdAt}",
                          style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Update AT : ",
                          style: TextStyle(
                              fontSize: the_bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${appdata!.data!.updatedAt}",
                          style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              label: Text("Next"),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return post2apipg();
                  },
                ));
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

class getvalueapipost {
  bool? success;
  Data? data;
  String? message;

  getvalueapipost({this.success, this.data, this.message});

  getvalueapipost.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? type;
  String? userType;
  String? name;
  String? firstName;
  String? lastName;
  String? image;
  String? email;
  Null? countryCode;
  String? phone;
  String? otp;
  int? isVerified;
  String? apiToken;
  String? dob;
  String? deviceToken;
  Null? stripeId;
  Null? cardBrand;
  Null? cardLastFour;
  Null? trialEndsAt;
  Null? braintreeId;
  Null? paypalEmail;
  String? referalCode;
  int? parentId;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<Null>? customFields;
  bool? hasMedia;
  List<Null>? media;

  Data(
      {this.id,
      this.type,
      this.userType,
      this.name,
      this.firstName,
      this.lastName,
      this.image,
      this.email,
      this.countryCode,
      this.phone,
      this.otp,
      this.isVerified,
      this.apiToken,
      this.dob,
      this.deviceToken,
      this.stripeId,
      this.cardBrand,
      this.cardLastFour,
      this.trialEndsAt,
      this.braintreeId,
      this.paypalEmail,
      this.referalCode,
      this.parentId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.customFields,
      this.hasMedia,
      this.media});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    userType = json['user_type'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    email = json['email'];
    countryCode = json['country_code'];
    phone = json['phone'];
    otp = json['otp'];
    isVerified = json['is_verified'];
    apiToken = json['api_token'];
    dob = json['dob'];
    deviceToken = json['device_token'];
    stripeId = json['stripe_id'];
    cardBrand = json['card_brand'];
    cardLastFour = json['card_last_four'];
    trialEndsAt = json['trial_ends_at'];
    braintreeId = json['braintree_id'];
    paypalEmail = json['paypal_email'];
    referalCode = json['referal_code'];
    parentId = json['parent_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    hasMedia = json['has_media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['user_type'] = this.userType;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['image'] = this.image;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['otp'] = this.otp;
    data['is_verified'] = this.isVerified;
    data['api_token'] = this.apiToken;
    data['dob'] = this.dob;
    data['device_token'] = this.deviceToken;
    data['stripe_id'] = this.stripeId;
    data['card_brand'] = this.cardBrand;
    data['card_last_four'] = this.cardLastFour;
    data['trial_ends_at'] = this.trialEndsAt;
    data['braintree_id'] = this.braintreeId;
    data['paypal_email'] = this.paypalEmail;
    data['referal_code'] = this.referalCode;
    data['parent_id'] = this.parentId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    data['has_media'] = this.hasMedia;

    return data;
  }
}
