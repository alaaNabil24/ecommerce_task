import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/sign_in_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.signInUseCase) : super(AuthInitial());

  final SignIn signInUseCase;

  Future<void> signIn(String email, String password) async {
    emit(LoginLoading());
    final user = await signInUseCase(email, password).then(
      (value) {
        emit(LoginSuccess());

      },
      onError: (error) {
        emit(LoginError());

      },
    );
  }
}
