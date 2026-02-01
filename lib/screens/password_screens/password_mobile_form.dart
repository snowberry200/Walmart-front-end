import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/bloc/auth_bloc.dart';
import 'package:walmart/bloc/auth_event.dart';
import 'package:walmart/widget/image_container.dart';
import 'package:walmart/widget/password_field.dart';
import 'package:walmart/widget/auth.dart';
import 'package:walmart/widget/validator.dart';
import '../../bloc/auth_state.dart';
import '../../layout/layout.dart';

class PasswordMobileForm extends StatefulWidget {
  final String callback;
  const PasswordMobileForm({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  State<PasswordMobileForm> createState() => _PasswordMobileFormState();
}

class _PasswordMobileFormState extends State<PasswordMobileForm> {
  Widget signinButton(AuthState state) {
    return Center(
      child: state.isLoading == true
          ? StatementValidator.showProgressiveBar()
          : ElevatedButton(
              onPressed: () {
                _handleLogin();
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color.fromARGB(255, 37, 98, 228),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size.fromHeight(50),
                fixedSize: const Size(150, 30),
              ),
              child: const Text(
                'Sign in',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
    );
  }

  Future<void> _handleLogin() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (kDebugMode) {
      print(passwordControllerKey.currentState!.passwordController.text.trim());
    }
    context.read<AuthBloc>().add(SignInEvent(
        email: widget.callback,
        password: passwordControllerKey.currentState!.passwordController.text
            .trim()));
  }

  final passwordControllerKey = GlobalKey<PasswordTextfieldState>();
  GlobalKey<FormState> formKey = GlobalKey();
  final authClient = AuthenticationClient();
  bool isChecked = true;

  Text forgot = const Text('Forgot password?',
      style: TextStyle(decoration: TextDecoration.underline, fontSize: 12));
  @override
  Widget build(BuildContext context) {
    final checkmark = Checkbox(
      value: isChecked,
      onChanged: (value) => setState(() {
        isChecked = value!;
      }),
      activeColor: CupertinoColors.black,
      checkColor: CupertinoColors.white,
      hoverColor: CupertinoColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      side: const BorderSide(width: 0.5),
    );
    Text passw = const Text(
      'Enter your password',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2),
    );

    Text eMail = const Text(
      'Email address',
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 1.0),
    );

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          StatementValidator.validateAuthStates(context, state);
        }

        if (state is Authenticated) {
          StatementValidator.validateAuthStates(context, state);
        }
        Future.delayed(const Duration(seconds: 2), () {
          if (context.mounted) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Layout()));
          }
        });
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: CupertinoColors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                      ),
                      child: Center(child: ImageContainer()),
                    ),
                    const SizedBox(height: 40),
                    Center(
                        child: Form(
                            key: formKey,
                            child: Column(children: [
                              passw,
                              SizedBox(
                                child: eMail,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 20, top: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      widget.callback,
                                      style: const TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.0),
                                    ),
                                    const SizedBox(width: 10),
                                    InkWell(
                                      hoverColor: CupertinoColors.white,
                                      child: const Center(
                                        child: Text(
                                          'Change',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 1.0,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: Colors.blue),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Layout()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              PasswordTextfield(key: passwordControllerKey),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: MaterialButton(
                                      hoverColor: Colors.white,
                                      onPressed: () {},
                                      child: forgot)),
                              Row(
                                children: [
                                  Transform.scale(scale: 1.3, child: checkmark),
                                  const SizedBox(width: 5),
                                  const Text(
                                    'Keep me signed in',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Uncheck if using public device.',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  MaterialButton(
                                    hoverColor: Colors.white,
                                    onPressed: () {},
                                    child: const Text('More',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 16)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: signinButton(state),
                              )
                            ]))),
                  ]),
            ));
      },
    );
  }
}
