import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walmart/bloc/auth_state.dart';

class StatementValidator {
  StatementValidator._();

  static void showSnackBar(
      {required BuildContext context,
      required String message,
      required Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  // Auth Statements
  static void showLoggedInStatement(BuildContext context, String message) {
    showSnackBar(context: context, message: message, color: Colors.green);
  }

  static void showSignUpMessage(BuildContext context, String message) {
    showSnackBar(color: Colors.green, context: context, message: message);
  }

  static void authValidateErrorMessage(BuildContext context, String message) {
    showSnackBar(color: Colors.red, context: context, message: message);
  }

  static void proceedToPassword(BuildContext context, String message) {
    showSnackBar(color: Colors.green, context: context, message: message);
  }

// validate States
  static bool validateAuthStates(
    BuildContext context,
    AuthState? state,
  ) {
    bool isValid = true;

    if (state is AuthError) {
      authValidateErrorMessage(context, state.message);
      isValid = false;
    }
    if (state is SignedUpState) {
      showSignUpMessage(
          context, 'Account created successfully. Please sign in.');
    }
    if (state is Authenticated) {
      showLoggedInStatement(context, 'Logged in successfully');
    }
    if (state is EmailContinueState) {
      proceedToPassword(context, 'Proceed to password entry');
    }
    return isValid;
  }

  //validate fields
  static CircularProgressIndicator showProgressiveBar() {
    return const CircularProgressIndicator(
      strokeCap: StrokeCap.square,
      backgroundColor: CupertinoColors.darkBackgroundGray,
      valueColor: AlwaysStoppedAnimation<Color>(CupertinoColors.inactiveGray),
      strokeWidth: 5.0,
    );
  }

  static String? validateName({required String? name}) {
    if (name == null || name.isEmpty) {
      return 'Name field cannot be empty';
    } else if (name.length < 4) {
      return 'Please enter a correct name (min 4 characters)';
    }
    return null;
  }

  static String? validateUsername({required String? username}) {
    if (username == null || username.isEmpty) {
      return 'Username field cannot be empty';
    } else if (username.length < 4) {
      return 'Please enter a correct username (min 4 characters)';
    }
    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null || password.isEmpty) {
      return 'Password field cannot be empty';
    } else if (password.length < 5) {
      return 'Password cannot be less than 5 characters';
    }
    return null;
  }
}
