import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/bloc/auth_bloc.dart';
import 'package:walmart/bloc/auth_event.dart';

class SignUpButton extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const SignUpButton({
    Key? key,
    Key? key,
    required this.formkey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  bool isSignedIn = true;

  Future<void> _handleSignup() async {
    context.read<AuthBloc>().add(SignUpEvent(null,
        name: widget.nameController.text.trim(),
        password: widget.passwordController.text.trim(),
        email: widget.emailController.text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _handleSignup,
      style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: CupertinoColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(width: 1)),
          minimumSize: const Size.fromHeight(50),
          fixedSize: const Size(150, 30)),
      child: Text(
        isSignedIn ? 'Create account' : 'sign in',
        style: TextStyle(
            decorationThickness: 1,
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: CupertinoColors.black),
      ),
    );
  }
}
