import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kare_kyoushi/util/firebase_documents.dart';

extension FirebaseFirestoreExtension on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> get users => collection(FirebaseDocuments.users);

  DocumentReference<Map<String, dynamic>> user(String id) => users.doc(id);
}
