import 'package:flutter/material.dart';
import 'package:samduapp/domain/services/auth_services.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';

class LoaderViewModel {
  final BuildContext context;
  final _authService = AuthService();

  LoaderViewModel(this.context) {
    asyncInit();
  }

  Future<void> asyncInit() async {
    await checkAuth();
  }

  Future<void> checkAuth() async {
    final isAuth = await _authService.isAuth();

    if (isAuth != null) {
      if (isAuth == '2') {
        Navigator.of(context)
            .pushReplacementNamed(MainNavigationRouteNames.mainTeacherScreen);
      } else if (isAuth == '1') {
        Navigator.of(context)
            .pushReplacementNamed(MainNavigationRouteNames.mainAdminScreen);
      } else if (isAuth == '3') {
        Navigator.of(context)
            .pushReplacementNamed(MainNavigationRouteNames.mainAdminScreen);
      }
    } else {
      Navigator.of(context)
          .pushReplacementNamed(MainNavigationRouteNames.login);
    }
    // final nextScreen = isAuth
    //     ? MainNavigationRouteNames.mainScreen
    //     : MainNavigationRouteNames.login;
    // Navigator.of(context).pushReplacementNamed(nextScreen);
  }
}
