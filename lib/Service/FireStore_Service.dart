import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';

class FirebaseHandler {
  FirebaseHandler({
    Firestore firestoreInstance,
  }) : _firestore = firestoreInstance ??
            firestore(); // firestore() is the default initializer for your firebase APP firestore.
  final Firestore _firestore;

  Stream getCollection(String collection, String uid) {
    try {
      return _firestore.collection(collection + "/").where('fieldPath', '==', '1').onSnapshot;
    } catch (e) {
      print('Error retrieving snapshot: $e');
      throw '$e';
    }
  }

  Stream searchCollection({
    String collection,
    String value,
    String name}
  ) {
    try {
      return _firestore
          .collection(collection + "/")
          .where(name, '==' ,value)
          .onSnapshot;
    } catch (e) {
      print('Error retrieving snapshot: $e');
      throw '$e';
    }
  }
}
// return _firestore.collection(collection + "/").where('fieldPath', '==', '1').onSnapshot
