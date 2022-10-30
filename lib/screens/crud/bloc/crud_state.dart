part of 'crud_bloc.dart';

class CrudState extends Equatable {
  final List<String> crudList;
  final String newTaskState;
  const CrudState(
      {this.crudList = const ["Computer", "Laptop", "Iphone"],
      this.newTaskState = ''});

  CrudState copyWith({
    List<String>? copyCrudList,
    String? newTaskState,
  }) {
    return CrudState(
      crudList: copyCrudList ?? crudList,
      newTaskState: newTaskState ?? this.newTaskState,
    );
  }

  @override
  List<Object> get props => [crudList, newTaskState];
}

class CrudInitial extends CrudState {}
