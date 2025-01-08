import 'package:flutter/material.dart';
import 'package:samduapp/domain/api_client/api_client_exception.dart';
import 'package:samduapp/domain/services/auth_services.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';

class LoginViewModel extends ChangeNotifier {
  final _authService = AuthService();

  final emailTextConroller = TextEditingController();
  final passwordTextConroller = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get isAuthProgress => _isAuthProgress;

  bool get canStartAuth => !_isAuthProgress;

  bool _isValid(String email, String password) =>
      email.isNotEmpty || password.isNotEmpty;

  Future<String?> _login(String email, String password) async {
    try {
      await _authService.login(email, password);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.network:
          return 'Сервер не доступен. Проверте подключение к интернету';
        case ApiClientExceptionType.auth:
          return 'Неправильный логин пароль!';
        case ApiClientExceptionType.other:
          return 'Произошла ошибка, Попробуйте еще раз';
        case ApiClientExceptionType.sessionExpired:
      }
    } catch (e) {
      'Неизвестная ошибка, повторите попытку';
    }
    return null;
  }

  Future<void> auth(BuildContext context) async {
    final email = emailTextConroller.text;
    final password = passwordTextConroller.text;

    if (!_isValid(email, password)) {
      _updateState('Заполните email и пароль', false);
      return;
    }
    _updateState(null, true);
    _errorMessage = await _login(email, password);
    if (_errorMessage == null) {
      MainNavigation.resetNavigation(context);
    } else {
      _updateState(_errorMessage, false);
    }
  }

  void _updateState(String? errorMessage, bool isAuthProgress) {
    if (_errorMessage == errorMessage && _isAuthProgress == isAuthProgress) {
      return;
    }

    _errorMessage = errorMessage;
    _isAuthProgress = isAuthProgress;
    notifyListeners();
  }

  void registrationButton(BuildContext context) {
    Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.registration);
  }
}
