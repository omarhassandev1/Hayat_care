import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

abstract class LayoutState {}
class LayoutInitial extends LayoutState {}
class LayoutChangeBranchState extends LayoutState {}

@singleton
class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(LayoutChangeBranchState());
  }
}