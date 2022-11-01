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
    emit(state.copyWith(newTaskState: event.changeText));
    print(state.newTaskState);
  }

  FutureOr<void> _addNewTask(AddNewTask event, Emitter<CrudState> emit) {
    if (event.newTask.isNotEmpty) {
      emit(state.copyWith(
          copyCrudList: List.from(state.crudList)..add(event.newTask)));
      event.fieldController.clear();
    }
  }
}
