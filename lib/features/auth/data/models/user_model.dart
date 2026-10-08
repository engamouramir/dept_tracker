import 'package:expense_tracker/features/auth/domain/enteties/user_entity.dart';

class UserModel {
  final String id;
  final String email;
  final String name;
  const UserModel({
    required this.id,
    required this.email,
    required this.name,
  }) ;
  factory UserModel.fromfirebase({
    required String id,
    required String email,
    required String name,
  }) {
    return UserModel(id: id, email: email, name: name);
  }

  

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      email: userEntity.email,
      name: userEntity.name,
    );
  }
  UserEntity toEntity() {
    return UserEntity(id: id, email: email, name: name);
  }
}
