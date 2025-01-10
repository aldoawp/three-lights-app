import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tlb_app/core/common/entities/user.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(UserEntity? user) {
    if (user != null) {
      emit(AppUserLoggedIn(user));
    } else {
      emit(AppUserInitial());
    }
  }
}
