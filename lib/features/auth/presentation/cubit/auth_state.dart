part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


class LoginSuccess extends AuthState {}

class LoginError extends AuthState {}
class LoginLoading extends AuthState {}
