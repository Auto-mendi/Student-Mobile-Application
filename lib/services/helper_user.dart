import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_mobile_app/routes.dart';
import 'package:student_mobile_app/view_models/user_management_view_model.dart';

void registerInUI(
  BuildContext context, {
  required TextEditingController firstNameController,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required TextEditingController confirmPasswordController,
}) async {
  if (context
      .read<UserManagementViewModel>()
      .registerFormKey
      .currentState!
      .validate()) {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      BackendlessUser user = BackendlessUser()
        ..email = emailController.text.trim()
        ..password = passwordController.text.trim()
        ..putProperties({'name': firstNameController.text.trim()});

      var result =
          await context.read<UserManagementViewModel>().registerUser(user);

      if (result == 'OK') {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account created succesfully')));
      }
    }
  }
}

void loginInUI(
  BuildContext context, {
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) async {
  String result = await context
      .read<UserManagementViewModel>()
      .loginUser(emailController.text.trim(), passwordController.text.trim());

  if (result == 'OK') {
    Navigator.pushNamed(context, RouteManager.homePage);
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Error logging in')));
  }
}

void lougoutInUI(BuildContext context) {
  context
      .read<UserManagementViewModel>()
      .logoutUser(context.read<UserManagementViewModel>().currentUser!);

  Navigator.popAndPushNamed(context, RouteManager.loginPage);
}

void resetPasswordinUI(BuildContext context,
    {required TextEditingController emailController}) {
  context
      .read<UserManagementViewModel>()
      .resetPassword(emailController.text.trim());
}
