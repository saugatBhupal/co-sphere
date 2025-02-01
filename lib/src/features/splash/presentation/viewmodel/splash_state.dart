part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {}

class StartupLoading extends SplashState {}

class SplashGetUserSuccess extends SplashState {
  final User? user;

  const SplashGetUserSuccess({
    this.user,
  });
}

class SplashGetUserFailed extends SplashState {}
