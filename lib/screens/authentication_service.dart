import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ratq_appp/models/user.dart';

enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
}

class AuthExceptionHandler {
  static handleAuthException(FirebaseAuthException e) {
    AuthStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthStatus.wrongPassword;
        break;
      case "weak-password":
        status = AuthStatus.weakPassword;
        break;
      case "email-already-in-use":
        status = AuthStatus.emailAlreadyExists;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }

  static String generateErrorMessage(error) {
    String errorMessage;
    switch (error) {
      case AuthStatus.invalidEmail:
        errorMessage = "Your email address appears to be malformed.";
        break;
      case AuthStatus.weakPassword:
        errorMessage = "Your password should be at least 6 characters.";
        break;
      case AuthStatus.wrongPassword:
        errorMessage = "Your email or password is wrong.";
        break;
      case AuthStatus.emailAlreadyExists:
        errorMessage =
            "The email address is already in use by another account.";
        break;
      default:
        errorMessage = "An error occured. Please try again later.";
    }
    return errorMessage;
  }
}

//Reset user password
class AuthenticationService {
  static final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  static String get currentUserUid => _auth.currentUser!.uid;
  Future<AuthStatus> resetPassword({
    required String email,
  }) async {
    var _status;
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => _status = AuthStatus.successful)
        .catchError(
            (e) => _status = AuthExceptionHandler.handleAuthException(e));
    return _status;
  }

  Future<String?> createNewUser(
      {required String email, required String password}) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (result.user != null) {
      return result.user!.uid;
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    if (result.user != null) {
      return result.user!.uid;
    }
    return null;
  }

  Future addUserData({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    final id = AuthenticationService.currentUserUid;
    final newUser = MyUser(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
    await _firestore
        .collection('users')
        .doc(AuthenticationService.currentUserUid)
        .set(
          newUser.toFirebase(),
        );
  }

  Future<MyUser?> getUser() async {
    DocumentSnapshot<Map<String, dynamic>> firebaseUser = await _firestore
        .collection('users')
        .doc(AuthenticationService.currentUserUid)
        .get();
    final userData = firebaseUser.data();

    if (userData != null) {
      final user = MyUser.fromFirebase(firebaseObj: firebaseUser.data()!);
      return user;
    }
    return null;
  }
}
