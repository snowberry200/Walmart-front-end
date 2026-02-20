import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walmart/widget/form_widget.dart';

class SubmitButton extends StatefulWidget {
  final void Function() handleLogin;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final String? name;
  final TextEditingController password;

  const SubmitButton({
    Key? key,
    Key? key,
    required this.handleLogin,
    required this.formKey,
    required this.emailController,
    required this.name,
    required this.password,
  }) : super(key: key);

  @override
  State<SubmitButton> createState() => SubmitButtonState();
}

class SubmitButtonState extends State<SubmitButton> {
  final FormWidget formWidget = FormWidget();
  late TextEditingController emailController;
  late String? name;
  late TextEditingController password;
  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
    name = widget.name;
    password = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 37, 98, 228),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: const Size.fromHeight(50),
        fixedSize: const Size(150, 30),
      ),
      onPressed: () async {
        widget.handleLogin();
      },
      child: const Text(
        'Continue',
        style: TextStyle(color: CupertinoColors.white),
      ),
    );
  }
}
