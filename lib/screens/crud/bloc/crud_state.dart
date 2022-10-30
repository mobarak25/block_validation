part of 'crud_bloc.dart';

class CrudState extends Equatable {
  final List<String> crudList;
  const CrudState({this.crudList = const ["Computer", "Laptop", "Iphone"]});

  CrudState copyWith({
    List<String>? copyCrudList,
  }) {
    return CrudState(
      crudList: copyCrudList ?? crudList,
    );
  }

  @override
  List<Object> get props => [crudList];
}

class CrudInitial extends CrudState {}
