import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class OptimizaAndroidFirebaseUser {
  OptimizaAndroidFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

OptimizaAndroidFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<OptimizaAndroidFirebaseUser> optimizaAndroidFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<OptimizaAndroidFirebaseUser>(
            (user) => currentUser = OptimizaAndroidFirebaseUser(user));
