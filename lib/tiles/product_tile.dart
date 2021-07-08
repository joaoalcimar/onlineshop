import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineshopflutter/datas/product_data.dart';
import 'package:onlineshopflutter/screens/products_screen.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductData data;

  ProductTile(this.type, this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductsScreen(data)));
      },
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
            : Row(children: <Widget>[
              // fix variabilidade tamanho do dispositivo
              Flexible(flex: 1, child: Image.network(
            data.images![0],fit: BoxFit.cover, height: 250.0,)),
              Flexible(flex: 1, child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(data.title.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                    Text(
                      "R\$" + data.price.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 211, 118, 130),
                          fontSize: 17.0),
                    )
                  ],
                ),
              )),
        ],

        ),
      ),
    );
  }
}
