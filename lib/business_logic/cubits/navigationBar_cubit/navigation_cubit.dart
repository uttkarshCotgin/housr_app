import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationBarItem { home, explore, save,booking }

class NavigationBarCubit extends Cubit<NavigationBarItem> {
  NavigationBarCubit() : super(NavigationBarItem.home);

  void selectItem(NavigationBarItem item) {
    emit(item);
  }
}