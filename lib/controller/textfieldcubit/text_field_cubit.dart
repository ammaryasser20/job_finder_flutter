import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/const.dart';


part 'text_field_state.dart';

class TextFieldCubit extends Cubit<TextFieldState> {
  TextFieldCubit() : super(TextFieldInitial());
  static TextFieldCubit get(context) => BlocProvider.of(context);
  int isValid = 0;
  bool passwordVisible = true;
  bool isAllNotEmpty = false;
  void clear(){
      isValid = 0;
   passwordVisible = true;
   isAllNotEmpty = false;
       emit(ClearTextField());
  }
  void isAllOKRegister() {
    if (emailCon.text.isNotEmpty &&
        userNameCon.text.isNotEmpty &&
        passCon.text.isNotEmpty) {
      isAllNotEmpty = true;
    } else {
      isAllNotEmpty = false;
    }
    emit(ChandIsEmpty());
  }

  void isAllOKLogin() {
    if (emailCon.text.isNotEmpty && passCon.text.isNotEmpty) {
      isAllNotEmpty = true;
    } else {
      isAllNotEmpty = false;
    }
    emit(ChandIsEmpty());
  }

  void chandValid({required int valid}) {
    isValid = valid;
    emit(ChangeValid());
  }

  void chandpasswordVisible() {
    passwordVisible = !passwordVisible;
    emit(ChangePasswordVisible());
  }

  void chandIsEmpty({required bool allOk}) {
    isAllNotEmpty = allOk;
    emit(ChandIsEmpty());
  }
}
