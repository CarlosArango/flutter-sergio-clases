import 'package:formz/formz.dart';

enum UsernameValidationError { empty }

class UsernameFormModel extends FormzInput<String, UsernameValidationError> {
  const UsernameFormModel.pure() : super.pure('');
  const UsernameFormModel.dirty([super.value = '']) : super.dirty();

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) return UsernameValidationError.empty;
    return null;
  }
}
