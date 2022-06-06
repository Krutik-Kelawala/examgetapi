import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:examgetapi/postapi1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class postapipage extends StatefulWidget {
  @override
  _postapipageState createState() => _postapipageState();
}

class _postapipageState extends State<postapipage> {
  Response? response;
  var dio = Dio();
  postapidata? viewlog;
  var postmydata;
  bool loaddataaaa = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getpostapidata();
  }

  getpostapidata() async {
    var dio = Dio();

    response = await dio.post(
        'https://parcel.cscodetech.com/de_api/dboy_login.php',
        data: {"mobile": 7276465975, "password": 123});

    print("Data===${response.toString()}");

    postmydata = jsonDecode(response.toString());
    setState(() {
      viewlog = postapidata.fromJson(postmydata);
      loaddataaaa = true;
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
    return loaddataaaa
        ? Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              label: Text("Next"),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return postapi1page();
                  },
                ));
              },
            ),
            appBar: AppBar(
              title: Text("Post api data"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(the_bodyheight * 0.01),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "ID : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.id}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Title : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.title}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Status : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.status}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Rate : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.rate}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Lcode : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.lcode}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Full address : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.fullAddress}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Pincode : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.pincode}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Landmark : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.landmark}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Commission : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.commission}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Bank name : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.bankName}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "IFSC : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.ifsc}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Receipt name : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.receiptName}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "A/C number : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.accNumber}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Paypal ID : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.paypalId}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "UPI id : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.upiId}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
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
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.email}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Password : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.password}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Rstatus : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.rstatus}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Mobile : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.mobile}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Accept : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.accept}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Reject : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.reject}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Complete : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.complete}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Dzone : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.dzone}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "Vehiid : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${viewlog!.dboydata!.vehiid}",
                            style: TextStyle(fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: the_bodyheight * 0.20,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "Cuurrency : ${viewlog!.currency}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Responsecode : ${viewlog!.responseCode}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Result : ${viewlog!.result}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Response MSg : ${viewlog!.responseMsg}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: the_bodyheight * 0.02),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: SpinKitFoldingCube(
              size: the_bodyheight * 0.2,
              color: Colors.orangeAccent,
            ),
          );
  }
}

class postapidata {
  Dboydata? dboydata;
  String? currency;
  String? responseCode;
  String? result;
  String? responseMsg;

  postapidata(
      {this.dboydata,
      this.currency,
      this.responseCode,
      this.result,
      this.responseMsg});

  postapidata.fromJson(Map<String, dynamic> json) {
    dboydata = json['dboydata'] != null
        ? new Dboydata.fromJson(json['dboydata'])
        : null;
    currency = json['currency'];
    responseCode = json['ResponseCode'];
    result = json['Result'];
    responseMsg = json['ResponseMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dboydata != null) {
      data['dboydata'] = this.dboydata!.toJson();
    }
    data['currency'] = this.currency;
    data['ResponseCode'] = this.responseCode;
    data['Result'] = this.result;
    data['ResponseMsg'] = this.responseMsg;
    return data;
  }
}

class Dboydata {
  String? id;
  String? title;
  String? rimg;
  String? status;
  String? rate;
  String? lcode;
  String? fullAddress;
  String? pincode;
  String? landmark;
  String? commission;
  String? bankName;
  String? ifsc;
  String? receiptName;
  String? accNumber;
  String? paypalId;
  String? upiId;
  String? email;
  String? password;
  String? rstatus;
  String? mobile;
  String? accept;
  String? reject;
  String? complete;
  String? dzone;
  String? vehiid;
  String? veImg;

  Dboydata(
      {this.id,
      this.title,
      this.rimg,
      this.status,
      this.rate,
      this.lcode,
      this.fullAddress,
      this.pincode,
      this.landmark,
      this.commission,
      this.bankName,
      this.ifsc,
      this.receiptName,
      this.accNumber,
      this.paypalId,
      this.upiId,
      this.email,
      this.password,
      this.rstatus,
      this.mobile,
      this.accept,
      this.reject,
      this.complete,
      this.dzone,
      this.vehiid,
      this.veImg});

  Dboydata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rimg = json['rimg'];
    status = json['status'];
    rate = json['rate'];
    lcode = json['lcode'];
    fullAddress = json['full_address'];
    pincode = json['pincode'];
    landmark = json['landmark'];
    commission = json['commission'];
    bankName = json['bank_name'];
    ifsc = json['ifsc'];
    receiptName = json['receipt_name'];
    accNumber = json['acc_number'];
    paypalId = json['paypal_id'];
    upiId = json['upi_id'];
    email = json['email'];
    password = json['password'];
    rstatus = json['rstatus'];
    mobile = json['mobile'];
    accept = json['accept'];
    reject = json['reject'];
    complete = json['complete'];
    dzone = json['dzone'];
    vehiid = json['vehiid'];
    veImg = json['ve_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rimg'] = this.rimg;
    data['status'] = this.status;
    data['rate'] = this.rate;
    data['lcode'] = this.lcode;
    data['full_address'] = this.fullAddress;
    data['pincode'] = this.pincode;
    data['landmark'] = this.landmark;
    data['commission'] = this.commission;
    data['bank_name'] = this.bankName;
    data['ifsc'] = this.ifsc;
    data['receipt_name'] = this.receiptName;
    data['acc_number'] = this.accNumber;
    data['paypal_id'] = this.paypalId;
    data['upi_id'] = this.upiId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['rstatus'] = this.rstatus;
    data['mobile'] = this.mobile;
    data['accept'] = this.accept;
    data['reject'] = this.reject;
    data['complete'] = this.complete;
    data['dzone'] = this.dzone;
    data['vehiid'] = this.vehiid;
    data['ve_img'] = this.veImg;
    return data;
  }
}
