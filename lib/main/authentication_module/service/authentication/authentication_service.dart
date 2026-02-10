import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tejara_store/main/authentication_module/errors/authentication_errors.dart';
import 'package:tejara_store/main/authentication_module/models/authentication_user.dart';
import 'package:tejara_store/main/authentication_module/models/signup_user.dart';

class AuthenticationService {
  late FirebaseAuth authentication;
  late FirebaseFirestore firestore;
  AuthenticationService._singleton();
  static final instance = AuthenticationService._singleton();
  factory AuthenticationService({
    required FirebaseAuth authentication,
    required FirebaseFirestore firestore,
  }) {
    instance.authentication = authentication;
    instance.firestore = firestore;
    return instance;
  }

  Future<AuthenticationUser> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await authentication
          .signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user!;
      return AuthenticationUser.fromFirebaseUser(user);
    } on FirebaseAuthException catch (firebaseAuthException) {
      throw AuthenticationError.fromFirebase(firebaseAuthException);
    } catch (error) {
      throw const AuthErrorUnknown();
    }
  }

  Future<AuthenticationUser> signupWithEmailAndPassword(
    SignupModel signupModel,
  ) async {
    try {
      UserCredential userCredential = await authentication
          .createUserWithEmailAndPassword(
            email: signupModel.email,
            password: signupModel.password,
          );
      final user = userCredential.user!;
      return AuthenticationUser.fromFirebaseUser(user);
    } on FirebaseAuthException catch (firebaseAuthException) {
      throw AuthenticationError.fromFirebase(firebaseAuthException);
    } catch (error) {
      throw const AuthErrorUnknown();
    }
  }

  Future<AuthenticationUser?> getAuthenticatedUser() async {
    final user = authentication.currentUser;
    if (user != null) {
      return AuthenticationUser.fromFirebaseUser(user);
    }
    return null;
  }
}
