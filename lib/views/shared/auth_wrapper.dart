import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/views/ui/homepage_view.dart';
import 'package:chat_app/views/ui/login_view.dart';
import 'package:flutter/material.dart';

class AuthenticationWrapper extends StatefulWidget {
  AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  State<AuthenticationWrapper> createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  final AuthenticationService auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePageView();
        } else {
          return const LoginView();
        }
      },
    );
  }
}
