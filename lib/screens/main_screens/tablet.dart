import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/bloc/auth_bloc.dart';
import 'package:walmart/bloc/auth_state.dart';
import 'package:walmart/layout/password_layout.dart';
import 'package:walmart/widget/form_widget.dart';
import 'package:walmart/widget/validator.dart';

import '../../widget/others.dart';

class TabletScreen extends StatefulWidget {
  const TabletScreen({Key? key}) : super(key: key);

  @override
  State<TabletScreen> createState() => TabletScreenState();
}

class TabletScreenState extends State<TabletScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Text text = const Text(
      'Sign in to your Walmart account',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'BogleWeb'),
    );

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // Handle auth state messages
        StatementValidator.validateAuthStates(context, state);

        // Handle navigation
        if (state is EmailContinueState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PasswordLayout(email: state.email),
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 6,
              child: SizedBox(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: Container(
                          width: width / 7,
                          height: width / 7,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: AssetImage('images/wall.png'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      const SizedBox(height: 30),
                      text,
                      const SizedBox(height: 10),
                      Center(
                        child: SizedBox(
                          width: width / 2,
                          child: FormWidget(),
                        ),
                      ),
                      Expanded(child: const SizedBox()),
                      BottomAppBar(
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20.0, left: 10, top: 0, right: 10),
                          child: ListView(
                            children: [
                              const OthersInfos(),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        );
      },
    );
  }
}
