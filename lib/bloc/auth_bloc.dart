import 'package:bloc/bloc.dart';
import 'package:walmart/bloc/auth_event.dart';
import 'package:walmart/bloc/auth_state.dart';
import 'package:walmart/database/database.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Database database;

  AuthBloc({required this.database}) : super(AuthInitial()) {
    on<SignInEvent>(_onSignInEvent);
    on<SignUpEvent>(_onSignUpEvent);
    on<EmailContinueEvent>(_onEmailContinueEvent);
    on<ToggleFormModeEvent>(_onToggleFormModeEvent);
  }
  Future<void> _onEmailContinueEvent(
      EmailContinueEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      emit(EmailContinueState(email: event.email));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

//toggle
  Future<void> _onToggleFormModeEvent(
      ToggleFormModeEvent event, Emitter<AuthState> emit) async {
    emit(ChangedCheckboxState(isSignInMode: !state.isSignedIn));
  }

  Future<void> _onSignInEvent(
      SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 5));

    try {
      await database.signin(email: event.email, password: event.password);
      await database.login(username: event.email, pass: event.password);
      emit(Authenticated(email: event.email));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onSignUpEvent(
      SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 3));

    try {
      await database.register(
          name: event.name, username: event.email, password: event.password);
      await database.signup(
          name: event.name, email: event.email, password: event.password);
      emit(SignedUpState('Account created successfully. Please sign in.',
          name: event.name, password: event.password, email: event.email));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
