import 'package:flutter/material.dart';
import 'appnotes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false, // Aqui desabilita o banner de debug
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue[200],
        centerTitle: true,
        leading:
          IconButton(
            icon: const Icon(Icons.filter_list_rounded, size: 35), // Ícone pré-existente do sistema
            color: Colors.white, // Cor do ícone
            onPressed: () {
              // Ação ao pressionar o ícone, se necessário
            },
          ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Lista de Tarefas',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TaskInput(),
              SizedBox(height: 10),
              Expanded(
                child: AppNotes(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskInput extends StatelessWidget {
  const TaskInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      child: Row(
        children: <Widget>[
          const Expanded(
            flex: 6,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Adicionar uma nova Lista',
                border: UnderlineInputBorder(),
              ),
              style: TextStyle(fontSize: 23),
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.white, size: 30),
                onPressed: () {
                  // Ação do botão
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
