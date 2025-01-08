import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/ui/themes/style.dart';

import 'package:samduapp/ui/widgets/auth_screen/login_view_model.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: const Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _LoginButtonWidget(),
            ),
            _RegisterButtonWidget(),
          ],
        ));
  }
}

class _LoginButtonWidget extends StatelessWidget {
  const _LoginButtonWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.read<LoginViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const _ErrorMessageWidget(),
        TextField(
          controller: model.emailTextConroller,
          decoration: kInputDecoration('Email'),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: model.passwordTextConroller,
          obscureText: true,
          decoration: kInputDecoration('Password'),
        ),
        const SizedBox(height: 20),
        const _AuthButtonWidget(),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LoginViewModel>();
    final onPressed = model.canStartAuth ? () => model.auth(context) : null;
    final child = model.isAuthProgress == true
        ? const SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : const Text('Login');

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.blue),
        padding: MaterialStateProperty.resolveWith(
            (states) => const EdgeInsets.symmetric(vertical: 10)),
      ),
      child: child,
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget();

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select((LoginViewModel m) => m.errorMessage);
    if (errorMessage == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.red,
        ),
      ),
    );
  }
}

class _RegisterButtonWidget extends StatelessWidget {
  const _RegisterButtonWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.read<LoginViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Dont have an acount? '),
        TextButton(
          child: const Text(
            'Register',
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: () => model.registrationButton(context),
        ),
      ],
    );
  }
}
