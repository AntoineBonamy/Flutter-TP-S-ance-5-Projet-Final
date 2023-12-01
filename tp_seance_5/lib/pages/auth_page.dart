import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tp_seance_5/pages/task_list.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Inscrit avec succès.")));
      // Utilisateur enregistré avec succès
    } on FirebaseAuthException catch (err) {
      // Gérer les erreurs
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erreur d'authentification: ${err.message}")));
    }
  }

  void _login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Connecté avec succès.")),
      );

      // Utilisateur connecté avec succès

      // Naviguer vers la page de la liste des tâches
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TaskList()),
      );
    } on FirebaseAuthException catch (err) {
      // Gérer les erreurs
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur d'authentification: ${err.message}")),
      );
    }
  }

  // ... rest of the code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Adresse mail')
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Mot de passe')
          ),
          const SizedBox(height: 32.0),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () => {
                        _register(),
                      },
                  child: const Text("S'inscrire")),
                  const SizedBox(width: 32.0),
              ElevatedButton(
                  onPressed: () => {
                        _login(),
                      },
                  child: const Text("Se connecter"))
            ],
          )
        ],
      )),
    );
  }
}
