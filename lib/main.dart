 import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:walmart/firebase_options.dart';
import 'layout/layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    const MaterialApp(
        debugShowCheckedModeBanner: false, home: AuthenticateWrapper()),
  );
  //AuthenticateWrapper()));
}

class AuthenticateWrapper extends StatelessWidget {
  const AuthenticateWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Layout();
  }
}
