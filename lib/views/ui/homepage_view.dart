import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Center(child: Text('ChatApp HomePage')),
            TextButton(
                onPressed: () {
                  AuthenticationService().signOut();
                },
                child: const Text('Signout')),
          ],
        ),
      ),
    );
  }
}
