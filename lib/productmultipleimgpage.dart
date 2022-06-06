import 'package:examgetapi/hugeapilistpage.dart';
import 'package:flutter/material.dart';

class productmultiimgpg extends StatefulWidget {
  List<ProductMultipleImage>? productMultipleImage;
  int index;

  productmultiimgpg(this.productMultipleImage, this.index);

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
        title: Text("${widget.productMultipleImage![widget.index].id}"),
        centerTitle: true,
      ),
    );
  }
}
