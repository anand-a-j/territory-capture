import '../../domain/entities/user_entity.dart';

class UserDTO {
  final String uid;
  final String email;
  final String name;
  final String photoUrl;

  UserDTO({
    required this.uid,
    required this.email,
    required this.name,
    required this.photoUrl,
  });

  UserEntity toEntity() =>
      UserEntity(uid: uid, email: email, name: name, photoUrl: photoUrl);
}
