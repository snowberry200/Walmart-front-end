import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/bloc/auth_bloc.dart';
import 'package:walmart/database/database.dart';

import '../screens/password_screens/password_desktop.dart';
import '../screens/password_screens/password_mobile_form.dart';
import '../screens/password_screens/password_tablet.dart';

class PasswordLayout extends StatefulWidget {
  final String email;

  const PasswordLayout({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<PasswordLayout> createState() => _PasswordLayoutState();
}

class _PasswordLayoutState extends State<PasswordLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(database: Database()),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return constraints.maxWidth > 1200
            ? PasswordDesktop(callback: widget.email)
            : constraints.maxWidth > 670 && constraints.maxWidth < 1200
                ? PasswordTablet(callback: widget.email)
                : PasswordMobileForm(callback: widget.email);
      }),
    );
  }
}
