import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  final CollectionReference userCollection = Firestore.instance.collection("users");

  DatabaseService(this.uid);

  Future updateUserData(String compCode) async {
    return await userCollection.document(uid).setData({
      "compCode" : compCode
    });
  }

  Stream<QuerySnapshot> get competitionUsers {
    return userCollection.snapshots();
  }
}