import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_mobile_app/auth/Firebase_auth/firebase_auth_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authService) : super(AuthInitial());
  final FirebaseAuthService _authService;

  Future<void> signIn(String email, String password) async {
    try {
      emit(AuthLoading());
      var user = await _authService.signInWithEmailandPassword(email, password);
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(AuthFailure("Sign in failed"));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
