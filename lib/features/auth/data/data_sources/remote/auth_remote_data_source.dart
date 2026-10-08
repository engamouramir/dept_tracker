import 'package:expense_tracker/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSource({required this.firebaseAuth});

  Future<UserModel> registerWithEmailAndPassword(String email, String password) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = credential.user!;
      return UserModel.fromfirebase(
        id: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
      );
    

  }
   Future<UserModel> loginWithEmailAndPassword(String email, String password) async {
    final credential =await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = credential.user!;
    return UserModel.fromfirebase(
      id: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
    );
  }


  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  

  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }
  
  
  Stream<User?> authStateChanges() {
    return firebaseAuth.authStateChanges();
  }
}

