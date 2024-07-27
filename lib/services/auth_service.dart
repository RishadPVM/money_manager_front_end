// services/auth_service.dart
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<String?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    }
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final jwt = googleAuth.idToken;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', jwt!);

    return jwt;
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt');
  }
}
