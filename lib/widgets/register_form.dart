import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/miscellaneous/validators.dart';
import 'package:student_mobile_app/services/helper_user.dart';
import 'package:student_mobile_app/view_models/user_management_view_model.dart';
import 'package:student_mobile_app/widgets/app_progress_indicator.dart';
import 'package:tuple/tuple.dart';

import '../miscellaneous/constants.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController firstNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<UserManagementViewModel, Tuple2<bool, String>>(
      selector: (context, value) =>
          Tuple2(value.showUserProgress, value.progressText),
      builder: (context, value, child) {
        return value.item1
            ? const AppProgressIndicator(
                text: 'Creating your account... Please Wait')
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: context.read<UserManagementViewModel>().registerFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: formDecoration('First Name',
                            iconData: Icons.person),
                        controller: firstNameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration:
                            formDecoration('Email', iconData: Icons.email),
                        controller: emailController,
                        validator: validateEmail,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: formDecoration('Password',
                            iconData: Icons.password),
                        controller: passwordController,
                        validator: validatePassword,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: formDecoration('Confirm Password',
                            iconData: Icons.password),
                        controller: confirmPasswordController,
                        validator: validatePassword,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          registerInUI(context,
                              firstNameController: firstNameController,
                              emailController: emailController,
                              passwordController: passwordController,
                              confirmPasswordController:
                                  confirmPasswordController);
                        },
                        style: buttonStyle,
                        child: const Text('Register'),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
