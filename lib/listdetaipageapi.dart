import 'package:examgetapi/hugeapilistpage.dart';
import 'package:examgetapi/productmultipleimgpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class listofapidetailpage extends StatefulWidget {
  List<ProductList>? productList;
  int index;

  listofapidetailpage(this.productList, this.index);

  @override
  _listofapidetailpageState createState() => _listofapidetailpageState();
}

class _listofapidetailpageState extends State<listofapidetailpage> {
  bool loadstatuschek = false;
  String img = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadstatuschek = true;
  }

  @override
  Widget build(BuildContext context) {
    double theheight = MediaQuery.of(context).size.height;
    double thewidth = MediaQuery.of(context).size.width;
    double theststuabar = MediaQuery.of(context).padding.top;
    double thenavigator = MediaQuery.of(context).padding.bottom;
    double theappbar = kToolbarHeight;
    double the_bodyheight = theheight - theststuabar - theappbar - thenavigator;
    return loadstatuschek
        ? Scaffold(
            appBar: AppBar(
              title: Text("ID : ${widget.productList![widget.index].id}"),
              centerTitle: true,
            ),
            body: WillPopScope(
              onWillPop: backwardpg,
              child: SingleChildScrollView(
                child: Container(
                  // margin: EdgeInsets.all(the_bodyheight * 0.01),
                  // decoration: BoxDecoration(border: Border.all(width: 1)),
                  height: the_bodyheight,
                  width: double.infinity,
                  child: Container(
                    padding: EdgeInsets.all(the_bodyheight * 0.01),
                    child: Column(
                      children: [
                        Container(
                          height: the_bodyheight * 0.35,
                          width: thewidth * 0.45,
                          child: img == ""
                              ? Container(
                                  decoration: BoxDecoration(
                                      // border: Border.all(width: 1),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${widget.productList![widget.index].image}"),
                                          fit: BoxFit.contain)),
                                )
                              : Container(
                                  child: Icon(Icons.person),
                                ),
                        ),
                        SizedBox(
                          height: the_bodyheight * 0.05,
                        ),
                        Row(
                          children: [
                            Text(
                              "ID : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Text(
                              "${widget.productList![widget.index].id}",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "P Name : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Text(
                              "${widget.productList![widget.index].pName}",
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
                              "S Name : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Text(
                              "${widget.productList![widget.index].sName}",
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
                              "P Status : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Text(
                              "${widget.productList![widget.index].pStatus}",
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
                              "Cat ID : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Text(
                              "${widget.productList![widget.index].catId}",
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
                              "Is Single : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Text(
                              "${widget.productList![widget.index].isSingle}",
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
                              "Unit : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Text(
                              "${widget.productList![widget.index].unit}",
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
                              "Weight : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Text(
                              "${widget.productList![widget.index].weight}",
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
                              "Description : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Expanded(
                              child: Text(
                                "${widget.productList![widget.index].description}",
                                style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Created : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Text(
                              "${widget.productList![widget.index].created}",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  color: Colors.redAccent
                                  // fontWeight: FontWeight.bold
                                  ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Alert Stock : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Expanded(
                              child: Text(
                                "${widget.productList![widget.index].alertStock}",
                                style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Seller ID : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Expanded(
                              child: Text(
                                "${widget.productList![widget.index].sellerId}",
                                style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "S Lat : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Expanded(
                              child: Text(
                                "${widget.productList![widget.index].sLat}",
                                style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "S Lng : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Expanded(
                              child: Text(
                                "${widget.productList![widget.index].sLng}",
                                style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Total Rating Row : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Expanded(
                              child: Text(
                                "${widget.productList![widget.index].totalRatingRow}",
                                style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Total Rating Count : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                            Expanded(
                              child: Text(
                                "${widget.productList![widget.index].totalRatingCount}",
                                style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return productmultiimgpg(
                                    widget.productList![widget.index]
                                        .productMultipleImage,
                                    widget.index);
                              },
                            ));
                          },
                          child: Row(
                            children: [
                              Text(
                                "Product Multiple Image : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: the_bodyheight * 0.02),
                              ),
                              Text(
                                "Tap to See ",
                                style: TextStyle(
                                    fontSize: the_bodyheight * 0.02,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : SpinKitFoldingCube(
            size: the_bodyheight * 0.2,
            color: Colors.orangeAccent,
          );
  }

  Future<bool> backwardpg() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return hugepg();
      },
    ));
    return Future.value(true);
  }
}
