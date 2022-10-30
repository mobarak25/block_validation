import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc() : super(CrudInitial()) {
    on<DeleteItem>(_deleteItem);
  }

  FutureOr<void> _deleteItem(DeleteItem event, Emitter<CrudState> emit) {
    emit(state.copyWith(
        copyCrudList: List.from(state.crudList)..removeAt(event.itemIndex)));
  }
}
