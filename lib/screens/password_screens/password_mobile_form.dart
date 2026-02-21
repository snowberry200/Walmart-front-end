import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/bloc/auth_bloc.dart';
import 'package:walmart/bloc/auth_event.dart';
import 'package:walmart/widget/image_container.dart';
import 'package:walmart/widget/password_field.dart';
import 'package:walmart/widget/validator.dart';
import '../../bloc/auth_state.dart';
import '../../layout/layout.dart';

// class PasswordMobileForm extends StatefulWidget {
//   final String callback;
//   const PasswordMobileForm({
//     Key? key,
//     required this.callback,
//   }) : super(key: key);

//   @override
//   State<PasswordMobileForm> createState() => _PasswordMobileFormState();
// }

// class _PasswordMobileFormState extends State<PasswordMobileForm> {
//   final GlobalKey<PasswordTextfieldState> passwordKey = GlobalKey();
//   TextEditingController get passwordController =>
//       passwordKey.currentState?.passwordController ?? TextEditingController();
//   Widget signinButton(AuthState state) {
//     return Center(
//       child: state.isLoading == true
//           ? StatementValidator.showProgressiveBar()
//           : ElevatedButton(
//               onPressed: () {
//                 _handleLogin();
//               },
//               style: ElevatedButton.styleFrom(
//                 elevation: 0,
//                 backgroundColor: const Color.fromARGB(255, 37, 98, 228),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 minimumSize: const Size.fromHeight(50),
//                 fixedSize: const Size(150, 30),
//               ),
//               child: const Text(
//                 'Sign in',
//                 style: TextStyle(color: CupertinoColors.white),
//               ),
//             ),
//     );
//   }

//   Future<void> _handleLogin() async {
//     if (!formKey.currentState!.validate()) {
//       return;
//     }
//     if (kDebugMode) {
//       print(passwordControllerKey.currentState!.passwordController.text.trim());
//     }
//     context.read<AuthBloc>().add(SignInEvent(
//         email: widget.callback,
//         password: passwordControllerKey.currentState!.passwordController.text
//             .trim()));
//   }

//   final passwordControllerKey = GlobalKey<PasswordTextfieldState>();
//   GlobalKey<FormState> formKey = GlobalKey();
//   final authClient = AuthenticationClient();
//   bool isChecked = true;

//   Text forgot = const Text('Forgot password?',
//       style: TextStyle(decoration: TextDecoration.underline, fontSize: 12));
//   @override
//   Widget build(BuildContext context) {
//     final checkmark = Checkbox(
//       value: isChecked,
//       onChanged: (value) => setState(() {
//         isChecked = value!;
//       }),
//       activeColor: CupertinoColors.black,
//       checkColor: CupertinoColors.white,
//       hoverColor: CupertinoColors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
//       side: const BorderSide(width: 0.5),
//     );
//     Text passw = const Text(
//       'Enter your password',
//       style: TextStyle(
//           fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2),
//     );

//     Text eMail = const Text(
//       'Email address',
//       style: TextStyle(
//           fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 1.0),
//     );

//     return BlocConsumer<AuthBloc, AuthState>(
//       listener: (context, state) {
//         if (state is AuthError) {
//           StatementValidator.validateAuthStates(context, state);
//         }

//         if (state is Authenticated) {
//           StatementValidator.validateAuthStates(context, state);
//         }
//         Future.delayed(const Duration(seconds: 2), () {
//           if (context.mounted) {
//             Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => Layout()));
//           }
//         });
//       },
//       builder: (context, state) {
//         return Scaffold(
//             backgroundColor: CupertinoColors.white,
//             body: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30.0),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 50,
//                       ),
//                       child: Center(child: ImageContainer()),
//                     ),
//                     const SizedBox(height: 40),
//                     Center(
//                         child: Form(
//                             key: formKey,
//                             child: Column(children: [
//                               passw,
//                               SizedBox(
//                                 child: eMail,
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(bottom: 20, top: 20),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       widget.callback,
//                                       style: const TextStyle(
//                                           fontStyle: FontStyle.italic,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w400,
//                                           letterSpacing: 1.0),
//                                     ),
//                                     const SizedBox(width: 10),
//                                     InkWell(
//                                       hoverColor: CupertinoColors.white,
//                                       child: const Center(
//                                         child: Text(
//                                           'Change',
//                                           style: TextStyle(
//                                               color: Colors.blue,
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.w400,
//                                               letterSpacing: 1.0,
//                                               decoration:
//                                                   TextDecoration.underline,
//                                               decorationColor: Colors.blue),
//                                         ),
//                                       ),
//                                       onTap: () {
//                                         Navigator.of(context).pushReplacement(
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     const Layout()));
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               PasswordTextfield(
//                                 key: passwordControllerKey,
//                                 controller: passwordController,
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Align(
//                                   alignment: Alignment.topRight,
//                                   child: MaterialButton(
//                                       hoverColor: Colors.white,
//                                       onPressed: () {},
//                                       child: forgot)),
//                               Row(
//                                 children: [
//                                   Transform.scale(scale: 1.3, child: checkmark),
//                                   const SizedBox(width: 5),
//                                   const Text(
//                                     'Keep me signed in',
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Row(
//                                 children: [
//                                   const Text(
//                                     'Uncheck if using public device.',
//                                     style: TextStyle(fontSize: 16),
//                                   ),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   MaterialButton(
//                                     hoverColor: Colors.white,
//                                     onPressed: () {},
//                                     child: const Text('More',
//                                         style: TextStyle(
//                                             decoration:
//                                                 TextDecoration.underline,
//                                             fontSize: 16)),
//                                   )
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Center(
//                                 child: signinButton(state),
//                               )
//                             ]))),
//                   ]),
//             ));
//       },
//     );
//   }
// }

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
  final GlobalKey<PasswordTextfieldState> passwordKey = GlobalKey();
  TextEditingController get passwordController =>
      passwordKey.currentState?.passwordController ?? TextEditingController();

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

  void _handleInactiveUser(String message, {Map<String, dynamic>? userData}) {
    // Get user name from userData if available
    String userName = userData?['name'] ?? '';
    String displayName = userName.isNotEmpty ? userName : 'there';

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Account Inactive',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.info_outline,
                color: Colors.orange,
                size: 50,
              ),
              const SizedBox(height: 16),
              Text(
                'Hello $displayName,',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Text(
                message.isNotEmpty
                    ? message
                    : 'Your account is currently inactive. Please contact customer support for assistance.',
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate back to email entry
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        const Layout(), // Or your email entry screen
                  ),
                );
              },
              child: const Text('OK'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 37, 98, 228),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _showSupportOptions(userName);
              },
              child: const Text('Contact Support'),
            ),
          ],
        );
      },
    );
  }

  void _showSupportOptions(String userName) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Customer Support',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Hello $userName, how can we help you?',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.email, color: Colors.blue),
                ),
                title: const Text('Email Support'),
                subtitle: const Text('support@walmart.com'),
                onTap: () {
                  Navigator.pop(context);
                  // Implement email launch
                  _showMessage('Opening email client...');
                },
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.phone, color: Colors.green),
                ),
                title: const Text('Call Support'),
                subtitle: const Text('1-800-WALMART (1-800-925-6278)'),
                onTap: () {
                  Navigator.pop(context);
                  // Implement phone call
                  _showMessage('Initiating call...');
                },
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.chat, color: Colors.orange),
                ),
                title: const Text('Live Chat'),
                subtitle: const Text('24/7 customer service'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to chat support
                  _showMessage('Opening live chat...');
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _handleActiveUser(String message) {
    // Show success message
    StatementValidator.showLoggedInStatement(
        context, message.isNotEmpty ? message : 'Logged in successfully');

    // Navigate to main layout after delay
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Layout()));
      }
    });
  }

  final passwordControllerKey = GlobalKey<PasswordTextfieldState>();
  GlobalKey<FormState> formKey = GlobalKey();
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
        // First handle errors
        if (state is AuthError) {
          StatementValidator.validateAuthStates(context, state);
          return;
        }

        // Handle authenticated state with status
        if (state is Authenticated) {
          // Check the user's status
          if (state.status == 'ACTIVE') {
            _handleActiveUser(state.message ?? 'Logged in successfully');
          } else if (state.status == 'NOT_ACTIVE') {
            _handleInactiveUser(state.message ?? 'Your account is inactive',
                userData: state.userData);
          } else {
            // Handle unknown status - default to showing error
            StatementValidator.authValidateErrorMessage(
                context, 'Unknown account status. Please contact support.');
          }

          // Still call the general validator for any common handling
          StatementValidator.validateAuthStates(context, state);
        }

        // Handle other states through the validator
        if (state is SignedUpState) {
          StatementValidator.validateAuthStates(context, state);
        }

        if (state is EmailContinueState) {
          StatementValidator.validateAuthStates(context, state);
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: CupertinoColors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Center(child: ImageContainer()),
                        ),
                        const SizedBox(height: 30),
                        Center(
                            child: Form(
                                key: formKey,
                                child: Column(children: [
                                  passw,
                                  const SizedBox(height: 10),
                                  eMail,
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, top: 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            widget.callback,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 1.0),
                                          ),
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
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Layout()));
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  PasswordTextfield(
                                    key: passwordControllerKey,
                                    controller: passwordController,
                                  ),
                                  const SizedBox(height: 20),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: MaterialButton(
                                          hoverColor: Colors.white,
                                          onPressed: () {
                                            // Handle forgot password
                                            _showMessage(
                                                'Password reset link will be sent to your email');
                                          },
                                          child: forgot)),
                                  Row(
                                    children: [
                                      Transform.scale(
                                          scale: 1.3, child: checkmark),
                                      const SizedBox(width: 5),
                                      const Text(
                                        'Keep me signed in',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
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
                                        onPressed: () {
                                          _showMessage(
                                              'For your security, uncheck on shared devices');
                                        },
                                        child: const Text('More',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 16)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Center(
                                    child: signinButton(state),
                                  )
                                ]))),
                      ]),
                ),
              ),
            ));
      },
    );
  }
}
