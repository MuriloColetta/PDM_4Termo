import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: AppAlunos()));
}

class AppAlunos extends StatefulWidget {
  @override
  _AppAlunosState createState() => _AppAlunosState();
}

class _AppAlunosState extends State<AppAlunos> {
  List<String> nome = [];
  List<String> idade = [];
  List<String> curso = [];

  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController cursoController = TextEditingController();

  void cadastrarAluno() {
    if (nomeController.text.isNotEmpty &&
        idadeController.text.isNotEmpty &&
        cursoController.text.isNotEmpty) {
      setState(() {
        nome.add(nomeController.text);
        idade.add(idadeController.text);
        curso.add(cursoController.text);

        nomeController.clear();
        idadeController.clear();
        cursoController.clear();
      });
    }
  }

  void removerAluno(int index) {
    setState(() {
      nome.removeAt(index);
      idade.removeAt(index);
      curso.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = nome.length;

    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Alunos")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: "Nome do aluno",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: idadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Idade do aluno",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: cursoController,
              decoration: InputDecoration(
                labelText: "Nome do curso",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(onPressed: cadastrarAluno, child: Text("Cadastrar")),
          SizedBox(height: 10),
          Text("Total de alunos: $total"),
          SizedBox(height: 10),
          Expanded(
            child: nome.isEmpty
                ? Center(child: Text("Nenhum aluno cadastrado"))
                : ListView.builder(
                    itemCount: nome.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          nome[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Idade: ${idade[index]} | Curso: ${curso[index]}",
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => removerAluno(index),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
