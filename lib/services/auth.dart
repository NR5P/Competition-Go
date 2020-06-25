import 'package:firebase_auth/firebase_auth.dart';
import 'package:streetracegather/helpers/competitorInfo.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //user object based on firebase user
  CompetitorInfo _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? CompetitorInfo(user.uid) : null;
  }

  // auth change user stream
  Stream<CompetitorInfo> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  //sign in anonymously
  Future signInAnonymously() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  //register with email and password

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}