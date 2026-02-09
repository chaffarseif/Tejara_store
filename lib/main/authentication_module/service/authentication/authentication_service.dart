import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  late FirebaseAuth _firebaseAuth;
  late FirebaseFirestore _firebaseFirestore;

  AuthenticationService() {
    _firebaseAuth = FirebaseAuth.instance;
    _firebaseFirestore = FirebaseFirestore.instance;
  }
}
