import 'package:flutter_application_improves/global/entities/user_entity.dart';
import 'package:flutter_application_improves/global/models/user_model.dart';

class AuthenticationRepository {
  Future<UserEntity> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(
        milliseconds: 5000,
      ),
    );

    throw "Error";
    return UserModel.empty;
  }

  Future<bool> logOut() async {
    return true;
  }
}
