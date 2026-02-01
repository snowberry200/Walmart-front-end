import 'package:flutter/material.dart';
import 'package:walmart/widget/validator.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({Key? key}) : super(key: key);

  @override
  PasswordTextfieldState createState() => PasswordTextfieldState();
}

class PasswordTextfieldState extends State<PasswordTextfield> {
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

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
