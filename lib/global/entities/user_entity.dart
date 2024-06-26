import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity(this.id, this.name, this.email);

  final String id;
  final String name;
  final String email;

  @override
  List<Object?> get props => [id, name, email];
}
