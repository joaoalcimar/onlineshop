import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  String? id, title, description, category;
  double? price;
  List? images, sizes;


  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data['title'];
    description = snapshot.data['description'];
    category = snapshot.data['category'];
    price = snapshot.data['price'];
    images = snapshot.data['images'];
    sizes = snapshot.data['sizes'];

  }


}