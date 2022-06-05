import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:examgetapi/lottiescreen.dart';
import 'package:examgetapi/viewdetailscreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MaterialApp(
    home: lottiepage(),
  ));
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var viewdata;
  myproductdataview? viewhere;
  bool screenloadstatus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getproductdata();
  }

  getproductdata() async {
    var response = await Dio().get('https://dummyjson.com/products');
    print(response.toString());

    viewdata = jsonDecode(response.toString());
    setState(() {
      viewhere = myproductdataview.fromJson(viewdata);
      screenloadstatus = true;
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
    return screenloadstatus
        ? Scaffold(
            appBar: AppBar(
              title: Text("Products"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                height: the_bodyheight,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(the_bodyheight * 0.005),
                      height: the_bodyheight * 0.94,
                      child: GridView.builder(
                        itemCount: viewhere!.products!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Container(
                            // height: the_bodyheight * 0.8,
                            // width: thewidth * 0.3,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return viewdetailpg(
                                        viewhere!.products![index]);
                                  },
                                ));
                              },
                              child: Card(
                                elevation: 5,
                                shadowColor: Colors.tealAccent,
                                color: Colors.white60,
                                borderOnForeground: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: the_bodyheight * 0.02,
                                    ),
                                    Container(
                                      height: the_bodyheight * 0.099,
                                      width: thewidth * 0.2,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${viewhere!.products![index].thumbnail}"),
                                              fit: BoxFit.contain)),
                                    ),
                                    SizedBox(
                                      height: the_bodyheight * 0.02,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: thewidth * 0.01),
                                      height: the_bodyheight * 0.023,
                                      width: thewidth * 0.4,
                                      child: Text(
                                        "${viewhere!.products![index].title}",
                                        style: TextStyle(
                                            fontSize: the_bodyheight * 0.02,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: thewidth * 0.01),
                                      height: the_bodyheight * 0.023,
                                      width: thewidth * 0.4,
                                      child: Text(
                                        "Rs : ${viewhere!.products![index].price} /-",
                                        style: TextStyle(
                                            fontSize: the_bodyheight * 0.02,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: thewidth * 0.01),
                                      height: the_bodyheight * 0.023,
                                      width: thewidth * 0.4,
                                      child: Text(
                                        "${viewhere!.products![index].brand}",
                                        style: TextStyle(
                                            fontSize: the_bodyheight * 0.02,
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(the_bodyheight * 0.01),
                          child: Text(
                            "Total : ${viewhere!.total}",
                            style: TextStyle(
                                fontSize: the_bodyheight * 0.02,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(the_bodyheight * 0.01),
                          child: Text(
                            "Skip : ${viewhere!.skip}",
                            style: TextStyle(
                                fontSize: the_bodyheight * 0.02,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(the_bodyheight * 0.01),
                          child: Text(
                            "Limit : ${viewhere!.limit}",
                            style: TextStyle(
                                fontSize: the_bodyheight * 0.02,
                                fontWeight: FontWeight.bold),
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
              color: Colors.orangeAccent,
              size: the_bodyheight * 0.2,
            ),
          );
  }
}

class myproductdataview {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  myproductdataview({this.products, this.total, this.skip, this.limit});

  myproductdataview.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  dynamic? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Products(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
