import 'package:flutter/material.dart';
import 'package:tp_seance_5/models/Task.dart';

class UpdateTask extends StatefulWidget {
  final Task task;
  const UpdateTask({required this.task, super.key});

  @override
  State<UpdateTask> createState() => UpdateTaskState();
}

class UpdateTaskState extends State<UpdateTask> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialisez les contrôleurs avec les valeurs de la tâche existante
    _titleController.text = widget.task.title;
    _descController.text = widget.task.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modifier une tâche"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Titre'),
            ),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            ElevatedButton(
                onPressed: () {
                  String updatedTitle = _titleController.text;
                  String updatedDescription = _descController.text;
                  print(widget.task.id);

                  if (updatedTitle.isNotEmpty &&
                      updatedDescription.isNotEmpty) {
                    // Créer une nouvelle tâche avec les valeurs mises à jour
                    Task updatedTask = Task(
                        id: widget.task.id,
                        title: widget.task.title,
                        description: widget.task.description);

                    // Renvoyer la tâche mise à jour à la page précédente
                    Navigator.pop(context, updatedTask);
                  } else {
                    // Afficher un message d'erreur si les champs sont vides
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Veuillez remplir tous les champs")));
                  }
                },
                child: const Text("Modifier"))
          ],
        ),
      ),
    );
  }
}
