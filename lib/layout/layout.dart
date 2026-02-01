import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/bloc/auth_bloc.dart';
import 'package:walmart/database/database.dart';

import '../screens/main_screens/desktop.dart';
import '../screens/main_screens/mobile.dart';
import '../screens/main_screens/tablet.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(database: Database()),
      child: Scaffold(
        backgroundColor: CupertinoColors.white,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth >= 1200) {
              return const DesktopScreen();
            } else if (constraints.maxWidth > 670 &&
                constraints.maxWidth < 1200) {
              return const TabletScreen();
            } else {
              return const MobileScreen();
            }
          },
        ),
      ),
    );
  }
}
