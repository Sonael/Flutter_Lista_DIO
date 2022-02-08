import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Contatos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lista de Contatos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [];

  @override
  void initState() {
    super.initState();
    contatos.add(Contato(
        nome: 'Otávio', telefone: '19239129', tipo: ContatoType.CELULAR));

    contatos.add(Contato(
        nome: 'João', telefone: '28347289', tipo: ContatoType.FAVORITO));

    contatos.add(Contato(
        nome: 'Lucas', telefone: '12978309128', tipo: ContatoType.TRABALHO));

    contatos.add(Contato(
        nome: 'Maria', telefone: '4812u7348012', tipo: ContatoType.CASA));

    contatos.add(Contato(
        nome: 'Cleber', telefone: '4918274128', tipo: ContatoType.FAVORITO));

    contatos.add(Contato(
        nome: 'Ana', telefone: '73129831729', tipo: ContatoType.TRABALHO));

    contatos.add(Contato(
        nome: 'Italo', telefone: '73129831729', tipo: ContatoType.TRABALHO));

    contatos.add(Contato(
        nome: 'Cleiton', telefone: '73129831729', tipo: ContatoType.TRABALHO));

    contatos.add(Contato(
        nome: 'Jonathan', telefone: '73129831729', tipo: ContatoType.TRABALHO));

    contatos.add(Contato(
        nome: 'Marcelo', telefone: '73129831729', tipo: ContatoType.TRABALHO));

    contatos.add(Contato(
        nome: 'Olivia', telefone: '73129831729', tipo: ContatoType.TRABALHO));

    contatos.add(Contato(
        nome: 'Sara', telefone: '73129831729', tipo: ContatoType.TRABALHO));

    contatos.add(Contato(
        nome: 'Rosangela',
        telefone: '73129831729',
        tipo: ContatoType.TRABALHO));

    contatos.add(Contato(
        nome: 'Ana', telefone: '73129831729', tipo: ContatoType.TRABALHO));

    contatos.sort((a, b) => a.nome.compareTo(b.nome));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              var contato = contatos[index];
              return ListTile(
                leading: CircleAvatar(
                  child: ContatoHelper.getIconByContato(contato.tipo),
                  backgroundColor: Colors.blue[200],
                ),
                title: Text(contato.nome),
                subtitle: Text(contato.telefone),
                trailing: IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () => {},
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: contatos
                .length) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class Contato {
  final String nome;
  final String telefone;
  final ContatoType tipo;

  Contato({required this.nome, required this.telefone, required this.tipo});
}

enum ContatoType { CELULAR, TRABALHO, FAVORITO, CASA }

class ContatoHelper {
  static Icon getIconByContato(ContatoType tipo) {
    switch (tipo) {
      case ContatoType.CELULAR:
        return Icon(Icons.phone_android, color: Colors.green[700]);
      case ContatoType.TRABALHO:
        return Icon(Icons.work, color: Colors.brown[600]);
      case ContatoType.FAVORITO:
        return Icon(Icons.star, color: Colors.yellow[600]);
      case ContatoType.CASA:
        return Icon(Icons.home, color: Colors.purple[600]);
    }
  }
}
