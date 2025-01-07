import 'dart:math';

import 'package:bloc_tutorial/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc loginBloc;
  final eamilFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "LOGIN SCREEN ",
                style: TextStyle(fontSize: 35),
              ),
              const SizedBox(height: 30),
              BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      current.email != previous.email,
                  builder: (context, state) {
                    return TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email',
                      ),
                      onChanged: (email) {
                        context
                            .read<LoginBloc>()
                            .add(EmailChanged(email: email));
                      },
                      focusNode: eamilFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      },
                    );
                  }),
              const SizedBox(height: 30),
              BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      current.password != previous.password,
                  builder: (context, state) {
                    return TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your password',
                      ),
                      focusNode: passwordFocusNode,
                      onChanged: (password) {
                        context
                            .read<LoginBloc>()
                            .add(PasswordChange(password: password));
                      },
                      onFieldSubmitted: (_) {
                        passwordFocusNode.unfocus();
                      },
                    );
                  }),
              const SizedBox(height: 30),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.status == LoginStatus.success) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  } else if (state.status == LoginStatus.loading) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("submiting wait")));
                  } else if (state.status == LoginStatus.error) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                  
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (previous, current) => false,
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginApi());
                        },
                        child: const Text('Login'),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
