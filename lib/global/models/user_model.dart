import 'package:flutter_application_improves/global/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(super.id, super.name, super.email);

  static const empty = UserModel('', '', '');
}
