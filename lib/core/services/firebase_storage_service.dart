import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_app_dashboard/core/services/database_services.dart';


class FirebaseStorageServices implements DataBaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
    required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getUserData(
      {required String path, required String uid}) async {
    var data = await firestore.collection(path).doc(uid).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> isExisits(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<dynamic> getData({required String path , String ? documentId , Map<String , dynamic> ? query}) async {
    if (documentId != null) {
      var doc = await firestore.collection(path).doc(documentId).get();
      return doc.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
       if(query['orderBy'] != null){
         data = data.orderBy(query['orderBy'] , descending: query['descending'] ?? false);
       }
       if(query['limit'] != null){
         data = data.limit(query['limit']);
       }
      }
      var result = await data.get();
      return result.docs.map((doc) => doc.data()).toList();
    }
  }

  @override
  Stream<dynamic> getStreamData({required String path , Map<String , dynamic> ? query})async* {
   Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
       if(query['orderBy'] != null){
         data = data.orderBy(query['orderBy'] , descending: query['descending'] ?? false);
       }
       if(query['limit'] != null){
         data = data.limit(query['limit']);
       }
      }
    await for (var result in data.snapshots()) {
      yield result.docs.map((doc) => doc.data()).toList();
    }
  }
}
