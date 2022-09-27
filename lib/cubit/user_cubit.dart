import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jtntrx/models/usermodel.dart';
import 'package:jtntrx/services/allservice.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void login() async {
    emit(UserLoading());
    UserModel user = await AllService().login();
    emit(UserSuccess(user));
  }
}
