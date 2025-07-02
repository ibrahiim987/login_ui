import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Your registration and login methods will go here
  Future<bool> loginWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('User signed in: ${userCredential.user?.uid}');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      } else {
        print('Login error: ${e.message}');
      }
    } catch (e) {
      print('Unexpected error: $e');
    }
    return false;
  }

  Future<bool> registerWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      print('User registered: ${userCredential.user?.uid}');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print('Registration error: ${e.message}');
      }
    } catch (e) {
      print('Unexpected error: $e');
    }
    return false;
  }
}
