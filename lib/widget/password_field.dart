// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:walmart/widget/validator.dart';

class PasswordTextfield extends StatefulWidget {
  final TextEditingController controller;
  const PasswordTextfield({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  PasswordTextfieldState createState() => PasswordTextfieldState();
}

class PasswordTextfieldState extends State<PasswordTextfield> {
  bool _obscureText = true;
  late TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordController = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      validator: (value) {
        return StatementValidator.validatePassword(password: value);
      },
    );
  }
}
