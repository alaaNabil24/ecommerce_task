import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({required String id, required String email}) : super(id: id, email: email);

  factory UserModel.fromFirebase(User user) {
    return UserModel(id: user.id, email: user.email);
  }
}