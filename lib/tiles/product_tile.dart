import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineshopflutter/datas/product_data.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductData data;

  ProductTile(this.type, this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: type == "grid"
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 0.8,
                    child: Image.network(
                      data.images![0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(data.title.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                            "R\$" + data.price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 211, 118, 130),
                                fontSize: 17.0),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Row(),
      ),
    );
  }
}
