part of 'crud_bloc.dart';

abstract class CrudEvent extends Equatable {
  const CrudEvent();

  @override
  List<Object> get props => [];
}

class DeleteItem extends CrudEvent {
  final int itemIndex;
  const DeleteItem({required this.itemIndex});
}

class ChangeFild extends CrudEvent {
  final String changeText;
  const ChangeFild({required this.changeText});
}

class AddNewTask extends CrudEvent {
  final String newTask;
  const AddNewTask({required this.newTask});
}
