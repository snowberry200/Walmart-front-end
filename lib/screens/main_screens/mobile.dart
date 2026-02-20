import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walmart/bloc/auth_bloc.dart';
import 'package:walmart/bloc/auth_state.dart';
import 'package:walmart/widget/form_widget.dart';
import 'package:walmart/layout/password_layout.dart';
import 'package:walmart/widget/image_container.dart';
import 'package:walmart/widget/validator.dart';
import '../../widget/others.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final TextEditingController email = TextEditingController();
  ScrollController scrollcontroller = ScrollController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PasswordLayout(email: state.email),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: CupertinoColors.white,
            body: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 40,
                    ),
                    child: ImageContainer(),
                  ),
                  text,
                  const SizedBox(height: 20),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 50),
                      child: FormWidget(),
                    ),
                  ),
                  const SizedBox(height: 60),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.2,
                  ),
                  SizedBox(
                    height: 220,
                    child: BottomAppBar(
                      color: Colors.transparent,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 0.0, left: 20, top: 0.0, right: 20),
                        child: const OthersInfos(),
                      ),
                    ),
                  ),
                ]),
              ),
            ));
      },
    );
  }
}
