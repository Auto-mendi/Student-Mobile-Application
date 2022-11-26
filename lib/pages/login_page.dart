import 'package:flutter/material.dart';
import 'package:student_mobile_app/routes.dart';
import 'package:student_mobile_app/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(125, 47, 74, 163),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginForm(),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteManager.registerPage);
                },
                child: const Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
