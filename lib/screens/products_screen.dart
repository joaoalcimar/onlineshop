import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onlineshopflutter/datas/product_data.dart';
import 'package:onlineshopflutter/tiles/product_tile.dart';

class ProductsScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  ProductsScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 211, 118, 130),
            title: Text(snapshot.data['title']),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.grid_on),
                ),
                Tab(
                  icon: Icon(Icons.list),
                ),
              ],
            ),
          ),
          body: FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
                  .collection("products")
                  .document(snapshot.documentID)
                  .collection('items')
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0,
                            childAspectRatio: 0.65),
                        itemBuilder: (context, index) {
                          return ProductTile(
                              "grid",
                              ProductData.fromDocument(
                                  snapshot.data!.documents[index]));
                        },
                        itemCount: snapshot.data!.documents.length,
                        padding: EdgeInsets.all(4.0),
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return ProductTile(
                              "list",
                              ProductData.fromDocument(
                                  snapshot.data!.documents[index]));
                        },
                        padding: EdgeInsets.all(4.0),
                        itemCount: snapshot.data!.documents.length,
                      )
                    ],
                  );
                }
              }),
        ));
  }
}
