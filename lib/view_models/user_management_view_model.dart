import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';

class UserManagementViewModel with ChangeNotifier {
  final registerFormKey = GlobalKey<FormState>();

  BackendlessUser? _currentUser;
  BackendlessUser? get currentUser => _currentUser;
  late bool isAdmin;

  bool _showUserProgress = false;
  bool get showUserProgress => _showUserProgress;

  String _progressText = '';
  String get progressText => _progressText;

  Future<String> checkIfAdmin() async {
    String result = 'OK';

    isAdmin = _currentUser!.getProperty('isAdmin');

    return result;
  }

  Future<String> loginUser(String email, String password) async {
    String result = 'OK';

    _showUserProgress = true;
    _progressText = 'Logging in';
    notifyListeners();
    notifyListeners();

    BackendlessUser? user =
        await Backendless.userService.login(email, password, true).onError(
      (error, stackTrace) {
        result = error.toString();
        return null;
      },
    );

    if (user != null) {
      _currentUser = user;
    }

    _showUserProgress = false;
    notifyListeners();

    return result;
  }

  Future<String> registerUser(BackendlessUser user) async {
    String result = 'OK';

    _showUserProgress = true;
    _progressText = 'Creating your account';
    notifyListeners();

    await Backendless.userService.register(user).onError((error, stackTrace) {
      result = error.toString();
      return null;
    });

    _showUserProgress = false;
    notifyListeners();

    return result;
  }

  Future<String> resetPassword(String email) async {
    String result = 'OK';

    await Backendless.userService
        .restorePassword(email)
        .onError((error, stackTrace) {
      result = error.toString();
      return null;
    });

    return result;
  }

  Future<String> logoutUser(BackendlessUser user) async {
    String result = 'OK';

    await Backendless.userService.logout().onError((error, stackTrace) {
      result = error.toString();
      _currentUser!.clearProperties();
    });

    notifyListeners();

    return result;
  }

  Future<String> checkIfUserLoggedIn() async {
    String result = 'OK';

    bool? validLogin = await Backendless.userService
        .isValidLogin()
        .onError((error, stackTrace) {
      result = error.toString();
    });

    if (validLogin != null && validLogin) {
      String? currentUserObjectId = await Backendless.userService
          .loggedInUser()
          .onError((error, stackTrace) {
        result = error.toString();
        return null;
      });
      if (currentUserObjectId != null) {
        Map<dynamic, dynamic>? mapOfCurrentUser = await Backendless.data
            .of("Users")
            .findById(currentUserObjectId)
            .onError((error, stackTrace) {
          result = error.toString();
        });

        if (mapOfCurrentUser != null) {
          _currentUser = BackendlessUser.fromJson(mapOfCurrentUser);
          notifyListeners();
        } else {
          result = 'NOT OK';
        }
      } else {
        result = 'NOT OK';
      }
    } else {
      result = 'NOT OK';
    }

    return result;
  }
}
