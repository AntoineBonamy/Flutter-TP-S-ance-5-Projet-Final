import 'package:flutter/material.dart';
import 'package:tp_seance_5/models/Task.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => AddTaskState();
}

class AddTaskState extends State<AddTask> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  String addTask = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ajouter une tâche"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Titre...'),
          ),
          TextField(
            controller: _descController,
            decoration: const InputDecoration(labelText: 'Description...'),
          ),
          ElevatedButton(
            onPressed: () {
              // Récupérez les valeurs des champs de texte
              String title = _titleController.text;
              String description = _descController.text;

              if (title.isNotEmpty && description.isNotEmpty) {
                // Créez une nouvelle tâche avec les valeurs des champs de texte
                Task newTask = Task(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: title,
                    description: description);

                // Renvoyez la nouvelle tâche à la page précédente
                Navigator.pop(context, newTask);
              } else {
                // Affichez un message d'erreur si les champs sont vides
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Veuillez remplir tous les champs")),
                );
              }
            },
            child: const Text("Ajouter"),
          )
        ])));
  }
}
