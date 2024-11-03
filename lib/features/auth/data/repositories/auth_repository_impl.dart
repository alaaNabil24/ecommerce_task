import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/user.dart';

import '../datasources/firebase_service.dart';

class AuthRepositoryImpl implements AuthRepository {
   FirebaseAuthDataSource ? dataSource;



  @override
  Future<User?> signIn(String email, String password) async {
    return await dataSource?.signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    return await dataSource?.signOut();
  }
}
