import 'package:examgetapi/exampostapi.dart';
import 'package:examgetapi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class viewdetailpg extends StatefulWidget {
  Products? detailproduct;

  viewdetailpg(this.detailproduct);

  @override
  _viewdetailpgState createState() => _viewdetailpgState();
}

class _viewdetailpgState extends State<viewdetailpg> {
  bool loadddingstatus = false;
  PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loadddingstatus = true;
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
    return loadddingstatus
        ? Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              label: Text("Next"),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return postapipage();
                  },
                ));
              },
            ),
            appBar: AppBar(
              title: Text("${widget.detailproduct!.title}"),
              centerTitle: true,
            ),
            body: WillPopScope(
              onWillPop: backpg,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(the_bodyheight * 0.01),
                  height: the_bodyheight,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                // margin: EdgeInsets.all(the_bodyheight * 0.02),
                                // height: the_bodyheight * 0.05,
                                // width: double.infinity,
                                child: PageView.builder(
                                  pageSnapping: true,
                                  itemCount:
                                      widget.detailproduct!.images!.length,
                                  itemBuilder: (context, index) {
                                    return InteractiveViewer(
                                      maxScale: 5,
                                      minScale: 0.1,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        // height: the_bodyheight * 0.4,
                                        // width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${widget.detailproduct!.images![index]}"),
                                                fit: BoxFit.contain)),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: the_bodyheight * 0.5,
                          width: thewidth,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${widget.detailproduct!.thumbnail}"),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                      SizedBox(
                        height: the_bodyheight * 0.02,
                      ),
                      // PageView.builder(
                      //   controller: controller,
                      //   itemCount: widget.detailproduct!.images!.length,
                      //   itemBuilder: (context, index) {
                      //     return Container(
                      //       height: the_bodyheight * 0.5,
                      //       width: thewidth * 0.3,
                      //       decoration: BoxDecoration(
                      //           image: DecorationImage(
                      //               image: NetworkImage(
                      //                   "${widget.detailproduct!.thumbnail}"),
                      //               fit: BoxFit.contain)),
                      //     );
                      //   },
                      // )
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "Id : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                          ),
                          Container(
                            child: Text(
                              "${widget.detailproduct!.id}",
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
                              "${widget.detailproduct!.title}",
                              style: TextStyle(fontSize: the_bodyheight * 0.02),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "Description : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                          ),
                          Container(
                            width: thewidth * 0.6,
                            child: Text(
                              "${widget.detailproduct!.description}",
                              style: TextStyle(fontSize: the_bodyheight * 0.02),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "Price : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                          ),
                          Container(
                            child: Text(
                              "${widget.detailproduct!.price} /- Rs",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "Discount : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                          ),
                          Container(
                            child: Text(
                              "${widget.detailproduct!.discountPercentage} % on product",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlueAccent,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "Rating : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                          ),
                          Container(
                            child: Text(
                              "${widget.detailproduct!.rating}",
                              style: TextStyle(
                                  color: Colors.red,
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
                              "Stock : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                          ),
                          Container(
                            child: Text(
                              "${widget.detailproduct!.stock} products available",
                              style: TextStyle(fontSize: the_bodyheight * 0.02),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "Brand : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                          ),
                          Container(
                            child: Text(
                              "${widget.detailproduct!.brand}",
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
                              "Category : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: the_bodyheight * 0.02),
                            ),
                          ),
                          Container(
                            child: Text(
                              "${widget.detailproduct!.category}",
                              style: TextStyle(fontSize: the_bodyheight * 0.02),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Center(
            child: SpinKitFoldingCube(
            color: Colors.orangeAccent,
            size: the_bodyheight * 0.2,
          ));
  }

  Future<bool> backpg() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return homepage();
      },
    ));
    return Future.value(true);
  }
}
