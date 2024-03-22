import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';

class UsernameInputWidget extends StatelessWidget {
  const UsernameInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (prev, curre) => prev.username != curre.username,
      builder: (context, state) {
        return Column(
          children: [
            Text(state.password.value),
            TextField(
              key: const Key('loginForm_usernameInput_textField'),
              onChanged: (username) =>
                  context.read<LoginBloc>().add(LoginUsernameChanged(username)),
              decoration: InputDecoration(
                labelText: 'username',
                errorText: state.username.displayError != null
                    ? 'invalid username'
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}
