
import 'package:flutter_bloc/flutter_bloc.dart';


part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
  static NavigationCubit get(context) => BlocProvider.of(context);
  int index = 0;

  void changeIndex({required int newIndex}) {
    index = newIndex;
    emit(ChangeIndex());
  }
}
