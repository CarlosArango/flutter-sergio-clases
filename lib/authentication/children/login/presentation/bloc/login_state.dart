part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.username = const UsernameFormModel.pure(),
    this.password = const PasswordFormModel.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus
      status; // message about the transaction, failuire or success
  final UsernameFormModel username; // change the value
  final PasswordFormModel password; // change the value
  final bool isValid; // valid if the fields are completed

  LoginState copyWith({
    FormzSubmissionStatus? status,
    UsernameFormModel? username,
    PasswordFormModel? password,
    bool? isValid,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}
