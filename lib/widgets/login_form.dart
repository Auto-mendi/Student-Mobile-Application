import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/miscellaneous/constants.dart';
import 'package:student_mobile_app/miscellaneous/validators.dart';
import 'package:student_mobile_app/routes.dart';
import 'package:student_mobile_app/services/helper_user.dart';
import 'package:student_mobile_app/view_models/user_management_view_model.dart';
import 'package:student_mobile_app/widgets/app_progress_indicator.dart';
import 'package:tuple/tuple.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<UserManagementViewModel, Tuple2<bool, String>>(
      selector: (context, value) =>
          Tuple2(value.showUserProgress, value.progressText),
      builder: (context, value, child) {
        return value.item1
            ? const AppProgressIndicator(text: 'Logging in')
            : Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //TODO: Decoration

                    const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage("assets/images/logo.png"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: emailController,
                        validator: validateEmail,
                        decoration:
                            formDecoration('Email', iconData: Icons.email)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: passwordController,
                      validator: validatePassword,
                      decoration:
                          formDecoration('Password', iconData: Icons.password),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        loginInUI(context,
                            emailController: emailController,
                            passwordController: passwordController);
                      },
                      style: buttonStyle,
                      child: const Text('Login'),
                    ),
                    TextButton(
                        onPressed: () {
                          resetPasswordinUI(context,
                              emailController: emailController);
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              );
      },
    );
  }
}
