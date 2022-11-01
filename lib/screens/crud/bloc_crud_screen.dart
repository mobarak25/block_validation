import 'package:block_validation/screens/crud/bloc/crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CrudScreen extends StatelessWidget {
  const CrudScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return BlocProvider(
      create: (_) => CrudBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Task List"),
        ),
        body: SingleChildScrollView(
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

                    MaterialButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (_) {
                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  const Text(
                                    "Add your task",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.red),
                                  ),
                                  Text(state.newTaskState),
                                  const SizedBox(height: 20),
                                  TextField(
                                    onChanged: (value) {
                                      bloc.add(ChangeFild(changeText: value));
                                    },
                                    controller: textController,
                                    decoration: InputDecoration(
                                      labelText: "Write something",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  OutlinedButton(
                                    child: const Text("Add"),
                                    onPressed: () {
                                      bloc.add(AddNewTask(
                                        newTask: textController.text,
                                        fieldController: textController,
                                      ));
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.add),
                    ),

                    // const Text(
                    //   "Add your task",
                    //   style: TextStyle(fontSize: 20, color: Colors.red),
                    // ),
                    // Text(state.newTaskState),
                    // const SizedBox(height: 20),
                    // TextField(
                    //   onChanged: (value) {
                    //     bloc.add(ChangeFild(changeText: value));
                    //   },
                    //   controller: textController,
                    //   decoration: InputDecoration(
                    //     labelText: "Write something",
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10)),
                    //   ),
                    // ),
                    // OutlinedButton(
                    //   child: const Text("gg"),
                    //   onPressed: () {
                    //     bloc.add(AddNewTask(
                    //       newTask: state.newTaskState,
                    //       fieldController: textController,
                    //     ));
                    //   },
                    // )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
