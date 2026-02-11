import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tejara_store/main/authentication_module/errors/authentication_errors.dart';
import 'package:tejara_store/main/authentication_module/models/authentication_user.dart';
import 'package:tejara_store/main/authentication_module/models/signup_user.dart';

class AuthenticationService {
  /// Singleton
  AuthenticationService._singleton();
  static final instance = AuthenticationService._singleton();
  factory AuthenticationService() => instance;

  final SupabaseClient supabase = Supabase.instance.client;

  /// LOGIN Email / Password
  Future<AuthenticationUser> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) {
        throw const AuthErrorUnknown();
      }

      return AuthenticationUser.fromSupabaseUser(user);
    } on AuthException catch (e) {
      throw AuthenticationError.fromSupabase(e);
    } catch (_) {
      throw const AuthErrorUnknown();
    }
  }

  /// SIGNUP Email / Password
  Future<AuthenticationUser> signupWithEmailAndPassword(
    SignupModel signupModel,
  ) async {
    try {
      final response = await supabase.auth.signUp(
        email: signupModel.email,
        password: signupModel.password,
        data: {
          'firstname': signupModel.firstname,
          'lastname': signupModel.lastname,
          'phone': signupModel.phone,
          'role': signupModel.role,
        },
      );

      final user = response.user;
      if (user == null) {
        throw const AuthErrorUnknown();
      }

      return AuthenticationUser.fromSupabaseUser(user);
    } on AuthException catch (e) {
      throw AuthenticationError.fromSupabase(e);
    } catch (_) {
      throw const AuthErrorUnknown();
    }
  }

  /// Récupère l'utilisateur actuellement connecté
  Future<AuthenticationUser?> getAuthenticatedUser() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      return AuthenticationUser.fromSupabaseUser(user);
    }
    return null;
  }

  /// Déconnexion
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}
