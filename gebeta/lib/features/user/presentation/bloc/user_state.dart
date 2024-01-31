import 'package:equatable/equatable.dart';

import '../../domain/entities/User.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitialState extends UserState {}

final class UserLoadingState extends UserState {}

final class SingleUserLoadedState extends UserState {
  final User user;

  const SingleUserLoadedState(this.user);

  @override
  List<Object> get props => [user];
}

final class UserUpdatedState extends UserState {
  final User user;

  const UserUpdatedState(this.user);

  @override
  List<Object> get props => [user];
}

final class UserErrorState extends UserState {
  final String message;

  const UserErrorState(this.message);

  @override
  List<Object> get props => [message];
}
