import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/usecases/usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final Logout logout;
  final Signup signup;
  final GetToken getToken;

  String? _token;

  String get authToken => _token ?? '';

  AuthBloc({
    required this.login,
    required this.logout,
    required this.signup,
    required this.getToken,
  }) : super(AuthInitialState()) {
    on<AuthLoginEvent>(_login);
    on<AuthLogoutEvent>(_logout);
    on<AuthRegisterEvent>(_signup);
    on<GetTokenEvent>(_getToken);
  }

  Future<void> _login(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await login(LoginParams(loginEntity: event.loginEntity));

    result.fold(
      (failure) => emit(
        AuthFailure(
          failure.toString(),
        ),
      ),
      (loginSuccess) => emit(UserAuthState(loginSuccess.token)),
    );
  }

  Future<void> _logout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await logout(LogoutParams(token: event.token));

    result.fold(
      (failure) => emit(
        AuthFailure(
          failure.toString(),
        ),
      ),
      (logoutSuccess) => emit(AuthSuccess()),
    );
  }

  Future<void> _signup(AuthRegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await signup(SignupParams(
      signupEntity: AuthEntity(
        username: event.username,
        password: event.password,
      ),
    ));

    result.fold(
      (failure) => emit(
        AuthFailure(
          failure.toString(),
        ),
      ),
      (signupSuccess) => emit(AuthSuccess()),
    );
  }

  Future<void> _getToken(GetTokenEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await getToken(NoParams());

    result.fold(
      (failure) {
        _token = null;
        emit(const UserAuthState(null));
      },
      (token) {
        _token = token;
        emit(UserAuthState(token));
      },
    );
  }
}
