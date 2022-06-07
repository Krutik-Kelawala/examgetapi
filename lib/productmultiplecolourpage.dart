import 'package:examgetapi/hugeapilistpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class productmulticlrpg extends StatefulWidget {
  List<ProductMultipleColor>? productMultipleColor;

  productmulticlrpg(this.productMultipleColor);

  @override
  _productmulticlrpgState createState() => _productmulticlrpgState();
}

class _productmulticlrpgState extends State<productmulticlrpg> {
  bool loadsstatusss = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      loadsstatusss = true;
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
    return loadsstatusss
        ? Scaffold(
            appBar: AppBar(
              title: Text("Product Multiple Colour"),
              centerTitle: true,
            ),
            body: WillPopScope(
              onWillPop: hugepagebackm,
              child: ListView.builder(
                itemCount: widget.productMultipleColor!.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    margin: EdgeInsets.all(the_bodyheight * 0.01),
                    padding: EdgeInsets.all(the_bodyheight * 0.01),
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
                              "${widget.productMultipleColor![index].success}",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Id : ",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productMultipleColor![index].id}",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
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
                              "${widget.productMultipleColor![index].productId}",
                              style: TextStyle(
                                fontSize: the_bodyheight * 0.02,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Colour : ",
                              style: TextStyle(
                                  fontSize: the_bodyheight * 0.02,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productMultipleColor![index].color}",
                              style: TextStyle(
                                fontSize: the_bodyheight * 0.02,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
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
            color: Colors.orangeAccent,
            size: the_bodyheight * 0.2,
          );
  }

  Future<bool> hugepagebackm() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return hugepg();
      },
    ));
    return Future.value(true);
  }
}
