import 'package:examgetapi/hugeapilistpage.dart';
import 'package:examgetapi/listdetaipageapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class custompricepage extends StatefulWidget {
  List<ProductCustomPrice>? productCustomPrice;

  custompricepage(this.productCustomPrice);

  @override
  _custompricepageState createState() => _custompricepageState();
}

class _custompricepageState extends State<custompricepage> {
  bool datawait = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      datawait = true;
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
    return datawait
        ? Scaffold(
            appBar: AppBar(
              title: Text("Product Custom Price"),
              centerTitle: true,
            ),
            body: WillPopScope(
              onWillPop: backmethodpg,
              child: ListView.builder(
                itemCount: widget.productCustomPrice!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(the_bodyheight * 0.01),
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    padding: EdgeInsets.all(the_bodyheight * 0.02),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Success : ",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productCustomPrice![index].success}",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "U Id : ",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productCustomPrice![index].uId}",
                              style: TextStyle(
                                fontSize: the_bodyheight * 0.02,
                                // fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Product Id : ",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productCustomPrice![index].productId}",
                              style: TextStyle(
                                fontSize: the_bodyheight * 0.02,
                                // fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Selling Price : ",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productCustomPrice![index].sellingPrice}",
                              style: TextStyle(
                                fontSize: the_bodyheight * 0.02,
                                // fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "MRP : ",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productCustomPrice![index].mrp}",
                              style: TextStyle(
                                fontSize: the_bodyheight * 0.02,
                                // fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Discount : ",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productCustomPrice![index].discount}",
                              style: TextStyle(
                                fontSize: the_bodyheight * 0.02,
                                // fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Size : ",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productCustomPrice![index].size}",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        : SpinKitFoldingCube(
            size: the_bodyheight * 0.2,
            color: Colors.orangeAccent,
          );
  }

  Future<bool> backmethodpg() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return hugepg();
      },
    ));
    return Future.value(true);
  }
}
