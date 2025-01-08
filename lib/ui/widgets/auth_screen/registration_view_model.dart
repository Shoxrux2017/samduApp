import 'package:flutter/material.dart';
import 'package:samduapp/domain/api_client/api_client_exception.dart';
import 'package:samduapp/domain/services/auth_services.dart';
import 'package:samduapp/ui/navigation/main_navigation.dart';

class RegistrationViewModel extends ChangeNotifier {
  final _authService = AuthService();

  final nameTextController = TextEditingController(),
      emailTextController = TextEditingController(),
      passwordTextController = TextEditingController(),
      passwordTextConfirmController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get isAuthProgress => _isAuthProgress;

  bool get canStartAuth => !_isAuthProgress;

  bool _isValid(String name, String email, String password) =>
      name.isNotEmpty || email.isNotEmpty || password.isNotEmpty;

  Future<String?> _registration(
      String name, String email, String password) async {
    try {
      await _authService.registration(name, email, password);
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
    final name = nameTextController.text;
    final email = emailTextController.text;
    final password = passwordTextController.text;

    if (!_isValid(name, email, password)) {
      _updateState('Заполните имя, email и пароль', false);
      return;
    }
    _updateState(null, true);
    _errorMessage = await _registration(name, email, password);
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

  void loginButton(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.login);
  }
}
