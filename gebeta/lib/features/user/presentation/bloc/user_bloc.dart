import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user.dart';
import '../../domain/usecases/update_user.dart';
import 'user_event.dart';
import 'user_state.dart';

export 'user_event.dart';
export 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUser getUser;
  final UpdateUser updateUser;

  UserBloc({
    required this.getUser,
    required this.updateUser,
  }) : super(UserInitialState()) {
    on<GetSingleUserEvent>(_getUser);
    on<UpdateUserEvent>(_updateUser);
  }

  Future<void> _getUser(
      GetSingleUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());

    final result = await getUser(GetUserParams(token: event.token));

    print('result: $result');

    result.fold(
      (failure) => emit(UserErrorState(failure.toString())),
      (user) => emit(SingleUserLoadedState(user as User)),
    );
  }

  Future<void> _updateUser(
      UpdateUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());

    final result = await updateUser(
        UpdateUserParams(user: event.user, token: event.token));

    result.fold(
      (failure) => emit(UserErrorState(failure.toString())),
      (user) => emit(SingleUserLoadedState(user as User)),
    );
  }
}
