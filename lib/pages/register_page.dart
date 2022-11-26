import 'package:flutter/material.dart';
import 'package:student_mobile_app/widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: RegisterForm()),
    );
  }
}
