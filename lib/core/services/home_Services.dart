

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices
{

  final CollectionReference _CategoryCollectionRef =
  FirebaseFirestore.instance.collection('Category');
  final CollectionReference _ProductsCollectionRef =
  FirebaseFirestore.instance.collection('products');
Future<List<QueryDocumentSnapshot>>  getCategory()async
  {
var value=await _CategoryCollectionRef.get();
return value.docs;


  }
  Future<List<QueryDocumentSnapshot>>  getBestSelling()async
  {
    var value=await _ProductsCollectionRef.get();
    return value.docs;


  }


}