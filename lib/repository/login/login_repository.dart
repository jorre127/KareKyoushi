import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LoginRepository {
  @factoryMethod
  factory LoginRepository(
    FirebaseAuth firebaseAuth,
  ) = _LoginRepository;

  bool get isLoggedIn;

  bool get isNotLoggedIn;

  Future<void> login({required String email, required String password});
}

class _LoginRepository implements LoginRepository {
  final FirebaseAuth _firebaseAuth;

  _LoginRepository(
    this._firebaseAuth,
  );

  @override
  bool get isLoggedIn => _firebaseAuth.currentUser != null;

  @override
  bool get isNotLoggedIn => _firebaseAuth.currentUser == null;

  @override
  Future<void> login({
    required String email,
    required String password,
  }) =>
      _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
}
