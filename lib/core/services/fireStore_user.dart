import 'package:alfatech/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('users');
  Future<void> addUsertoFireStore(UserModel userModel) async
  {
    return await _userCollectionRef.doc(userModel.UserId).set(userModel.toJson());


  }
}
