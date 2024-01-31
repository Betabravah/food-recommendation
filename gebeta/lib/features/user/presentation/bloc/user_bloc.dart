import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/User.dart';
import '../../domain/usecases/get_user.dart';
import 'User_event.dart';
import 'User_state.dart';

export 'User_event.dart';
export 'User_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUser getUser;

  UserBloc({
    required this.getUser,
  }) : super(UserInitialState()) {
    on<GetSingleUserEvent>(_getUser);
  }

  Future<void> _getUser(
      GetSingleUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());

    final result = await getUser(GetUserParams(token: event.token));

    result.fold(
      (failure) => emit(UserErrorState(failure.toString())),
      (user) => emit(SingleUserLoadedState(user as User)),
    );
  }
}