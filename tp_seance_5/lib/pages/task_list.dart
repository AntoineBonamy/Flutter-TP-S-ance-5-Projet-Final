import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tp_seance_5/pages/add_task.dart';
import 'package:tp_seance_5/pages/update_task.dart';
import '../models/Task.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Future<void> addTask(Task task) async {
    try {
      await FirebaseFirestore.instance.collection('tasks').add(task.toMap());
      tasks.add(task);
      setState(() {});
      print("Task added to Firestore successfully");
    } catch (e) {
      print("Error adding task to Firestore: $e");
    }
  }

  Future<List<Task>> getTasks() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('tasks').get();

      List<Task> tasks = [];
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc
          in querySnapshot.docs) {
        tasks.add(Task.fromMap(doc.data())..id = doc.id);
      }
      return tasks;
    } catch (e) {
      print("Error getting tasks from Firestore: $e");
      return []; // Retournez une liste vide en cas d'erreur
    }
  }

  Future<void> updateTask(String documentId, Task task) async {
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(documentId)
        .update(task.toMap());
    setState(() {});
  }

  Future<void> deleteTask(String taskId) async {
    await FirebaseFirestore.instance.collection('tasks').doc(taskId).delete();
  }

  late List<Task> tasks;

  @override
  void initState() {
    super.initState();
    tasks = [];
    getTasks().then((taskList) {
      setState(() {
        tasks = taskList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Liste des Tâches'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: (() async {
                  final result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AddTask()));

                  if (result != null) {
                    await addTask(result);
                  }
                }),
                child: const Text("Ajouter une tâche"),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tasks[index].title),
                      subtitle: Text(tasks[index].description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () async {
                              final updatedTask = await Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UpdateTask(task: tasks[index]),
                                ),
                              );
                              if (updatedTask != null) {
                                final documentId = tasks[index].id;
                                print (documentId);
                                setState(() {
                                  tasks[index] = updatedTask;
                                });
                                await updateTask(documentId, updatedTask);
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async {
                              await deleteTask("1");
                              setState(() {
                                tasks.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
