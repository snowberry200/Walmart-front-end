import 'package:bloc/bloc.dart';
import 'package:walmart/Model/Response/auth_response_dto.dart';
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

  Future<void> _onToggleFormModeEvent(
      ToggleFormModeEvent event, Emitter<AuthState> emit) async {
    emit(ChangedCheckboxState(isSignInMode: !state.isSignedIn));
  }

  Future<void> _onSignInEvent(
      SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 5));

    try {
      // Get the AuthResponseDTO from database signin
      final AuthResponseDTO response =
          await database.signin(email: event.email, password: event.password);

      // Also call login if needed for firebase
      await database.login(username: event.email, pass: event.password);

      // Determine status based on isActive from response
      // Convert bool to "ACTIVE"/"NOT_ACTIVE" string to match your Authenticated class
      String status = response.isActive ? "ACTIVE" : "NOT_ACTIVE";

      // Get message from response or use default
      String message;
      if (response.message.isNotEmpty) {
        message = response.message;
      } else {
        message =
            response.isActive ? "Login successful" : "Account is inactive";
      }

      // Convert user data to Map if needed for userData field
      Map<String, dynamic> userData = response.user.toJson();

      // Emit Authenticated state with all the data
      emit(Authenticated(
        email: event.email,
        status: status,
        message: message,
        userData: userData,
      ));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onSignUpEvent(
      SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

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
