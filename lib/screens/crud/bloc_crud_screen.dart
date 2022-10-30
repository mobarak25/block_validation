import 'package:block_validation/screens/crud/bloc/crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CrudScreen extends StatelessWidget {
  const CrudScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Task List"),
      ),
      body: BlocProvider(
        create: (context) => CrudBloc(),
        child: Center(
          child: BlocBuilder<CrudBloc, CrudState>(
            builder: (context, state) {
              final bloc = context.read<CrudBloc>();
              return Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.crudList.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            tileColor: Colors.amber,
                            trailing: IconButton(
                              onPressed: () {
                                bloc.add(DeleteItem(itemIndex: index));
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            title: Text(state.crudList[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    "Add your task",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.red),
                                  ),
                                  const SizedBox(height: 20),
                                  TextField(
                                    controller: textController,
                                    decoration: InputDecoration(
                                      labelText: "Write something",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      bloc.add(
                                        AddNewTask(
                                            newTask: textController.value
                                                .toString()),
                                      );
                                    },
                                    child: const Text("Add data"),
                                  )
                                ],
                              ),
                            );
                          });
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
