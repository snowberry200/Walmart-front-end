import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInEvent extends AuthEvent {
  final dynamic password;
  final String email;

  SignInEvent({required this.password, required this.email});

  @override
  List<Object?> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String? message;

  SignUpEvent(this.message,
      {required this.name, required this.password, required this.email});

  @override
  List<Object?> get props => [email, name, password];
}

class EmailContinueEvent extends AuthEvent {
  final String email;

  EmailContinueEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class ToggleFormModeEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
