import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

final class LoadAllUsersEvent extends UserEvent {}

final class GetSingleUserEvent extends UserEvent {
  final String token;

  const GetSingleUserEvent(this.token);

  @override
  List<Object> get props => [token];
}

final class UpdateUserEvent extends UserEvent {
  final String token;
  final User user;

  const UpdateUserEvent(this.user, this.token);

  @override
  List<Object?> get props => [user, token];
}
