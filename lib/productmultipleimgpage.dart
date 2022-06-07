import 'package:examgetapi/hugeapilistpage.dart';
import 'package:flutter/material.dart';

class productmultiimgpg extends StatefulWidget {
  List<ProductMultipleImage>? productMultipleImage;

  productmultiimgpg(this.productMultipleImage);

  @override
  _productmultiimgpgState createState() => _productmultiimgpgState();
}

class _productmultiimgpgState extends State<productmultiimgpg> {
  @override
  Widget build(BuildContext context) {
    double theheight = MediaQuery.of(context).size.height;
    double thewidth = MediaQuery.of(context).size.width;
    double theststuabar = MediaQuery.of(context).padding.top;
    double thenavigator = MediaQuery.of(context).padding.bottom;
    double theappbar = kToolbarHeight;
    double the_bodyheight = theheight - theststuabar - theappbar - thenavigator;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Multiple image"),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: listpageback,
        child: ListView.builder(
          itemCount: widget.productMultipleImage!.length,
          itemBuilder: (context, index1) {
            return Container(
              margin: EdgeInsets.all(the_bodyheight * 0.01),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              padding: EdgeInsets.all(the_bodyheight * 0.01),
              child: Column(
                children: [
                  Container(
                    height: the_bodyheight * 0.3,
                    width: thewidth * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "${widget.productMultipleImage![index1].productImage}"),
                            fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    height: the_bodyheight * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        "Success : ",
                        style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.productMultipleImage![index1].success!}",
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
                        "Id : ",
                        style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.productMultipleImage![index1].id!}",
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
                        "Prodyct id : ",
                        style: TextStyle(
                            fontSize: the_bodyheight * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.productMultipleImage![index1].productId!}",
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
    );
  }

  Future<bool> listpageback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return hugepg();
      },

    ));
    return Future.value(true);
  }
}
