import 'package:bloc/bloc.dart';
import 'package:customer_laundry_app/core/errors/failure.dart';
import 'package:customer_laundry_app/features/auth/data/models/auth_model.dart';
import 'package:customer_laundry_app/features/auth/domain/usecases/auth_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase registerUsecase;

  AuthBloc({required this.registerUsecase}) : super(AuthInitial()) {
    on<RegisterRequestedEvent>(_onRegisterRequested);
    // on<RegisterRequestedEvent>(_onRegisterRequested);
    on<LoginRequestedEvent>(_onLoginRequested);
    on<TogglePasswordVisibilityEvent>(
        _onTogglePasswordVisibility); // Ensure this is registered
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();

  bool isPasswordHide = true;

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  void _onRegisterRequested(
    RegisterRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(RegisterLoading());

    final authModel = AuthModel(
      username: event.username,
      email: event.email,
      password: event.password,
    );

    final result = await registerUsecase.callRegister(authModel: authModel);

    result.fold(
      (failure) => emit(RegisterFailure(error: _mapFailureToMessage(failure))),
      (success) => emit(RegisterSuccess()),
    );
  }

  void _onLoginRequested(
    LoginRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(RegisterLoading());

    // final authModel = AuthModel(
    //   email: event.email,
    //   password: event.password,
    // );

    // final result = await registerUsecase.callRegister(authModel: authModel);

    // result.fold(
    //   (failure) => emit(RegisterFailure(error: _mapFailureToMessage(failure))),
    //   (success) => emit(RegisterSuccess()),
    // );
  }

  void _onTogglePasswordVisibility(
    TogglePasswordVisibilityEvent event,
    Emitter<AuthState> emit,
  ) {
    isPasswordHide = !isPasswordHide;
    emit(PasswordVisibilityToggled(isPasswordHide: isPasswordHide));
  }

  void onTogglePasswordVisibility() {
    add(TogglePasswordVisibilityEvent());
  }

  String _mapFailureToMessage(Failure failure) {
    return failure is ServerFailure ? failure.errorMessage : 'Unexpected Error';
  }
}
