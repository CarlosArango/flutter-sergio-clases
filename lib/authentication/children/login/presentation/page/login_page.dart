import 'package:flutter/material.dart';
import 'package:flutter_application_improves/authentication/children/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_application_improves/authentication/children/login/presentation/widgets/login_form.dart';
import 'package:flutter_application_improves/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider<LoginBloc>(
          create: (context) =>
              LoginBloc(authenticationRepository: AuthenticationRepository()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
