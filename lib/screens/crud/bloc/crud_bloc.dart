import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc() : super(CrudInitial()) {
    on<DeleteItem>(_deleteItem);
    on<ChangeFild>(_changeFild);
    on<AddNewTask>(_addNewTask);
  }

  FutureOr<void> _deleteItem(DeleteItem event, Emitter<CrudState> emit) {
    emit(state.copyWith(
        copyCrudList: List.from(state.crudList)..removeAt(event.itemIndex)));
  }

  FutureOr<void> _changeFild(ChangeFild event, Emitter<CrudState> emit) {
    print(state.newTaskState);
    emit(state.copyWith(newTaskState: event.changeText));
  }

  FutureOr<void> _addNewTask(AddNewTask event, Emitter<CrudState> emit) {
    if (state.newTaskState.isNotEmpty) {
      emit(state.copyWith(
          copyCrudList: List.from(state.crudList)..add(event.newTask)));
      event.fieldController.clear();
    }
  }
}
