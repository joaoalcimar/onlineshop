import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:onlineshopflutter/datas/product_data.dart';

class ItemScreen extends StatefulWidget {
  final ProductData product;

  ItemScreen(this.product);

  @override
  _ItemScreenState createState() => _ItemScreenState(product);
}

class _ItemScreenState extends State<ItemScreen> {
  final ProductData product;

  String? size;

  _ItemScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color.fromARGB(255, 211, 118, 130);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title.toString(),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.99,
            child: Carousel(
              images: product.images!.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 4.0,
              dotBgColor: Colors.transparent,
              dotSpacing: 15.0,
              dotColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  product.title.toString(),
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text(
                  "R\$" + product.price.toString(),
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Size",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 34.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.5),
                    children: product.sizes!.map((sizes) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            size = sizes;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            border: Border.all(
                                color:
                                    size == sizes ? primaryColor : Colors.grey,
                                width: 3.0),
                          ),
                          width: 50.0,
                          alignment: Alignment.center,
                          child: Text(sizes),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    color: primaryColor,
                    onPressed: size != null ? () {} : null,
                    child: Text(
                      "Put on the Cart",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 16.0,),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                Text(product.description.toString(), style: TextStyle(fontSize: 16.0),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
