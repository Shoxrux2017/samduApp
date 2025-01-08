import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samduapp/ui/themes/style.dart';
import 'package:samduapp/ui/widgets/auth_screen/registration_view_model.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({super.key});

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _RegistrationFormWidget(),
          ),
          _LoginButtonWidget(),
        ],
      ),
    );
  }
}

class _RegistrationFormWidget extends StatelessWidget {
  const _RegistrationFormWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationViewModel>();
    return Column(
      children: [
        const SizedBox(height: 30),
        const _ErrorMessageWidget(),
        TextField(
          controller: model.nameTextController,
          decoration: kInputDecoration('Name'),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: model.emailTextController,
          decoration: kInputDecoration('Email'),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: model.passwordTextController,
          obscureText: true,
          decoration: kInputDecoration('Password'),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: model.passwordTextConfirmController,
          obscureText: true,
          decoration: kInputDecoration('Confirm password'),
        ),
        const SizedBox(height: 20),
        const _RegistrationButtonWidget(),
      ],
    );
  }
}

class _RegistrationButtonWidget extends StatelessWidget {
  const _RegistrationButtonWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegistrationViewModel>();
    final onPressed = model.canStartAuth ? () => model.auth(context) : null;
    final child = model.isAuthProgress == true
        ? const SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : const Text('Registration', style: TextStyle(color: Colors.white));

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.blue),
        padding: MaterialStateProperty.resolveWith((states) =>
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
      ),
      child: child,
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget();

  @override
  Widget build(BuildContext context) {
    final errorMessage =
        context.select((RegistrationViewModel m) => m.errorMessage);
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

class _LoginButtonWidget extends StatelessWidget {
  const _LoginButtonWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account? '),
        TextButton(
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: () => model.loginButton(context),
        ),
      ],
    );
  }
}
