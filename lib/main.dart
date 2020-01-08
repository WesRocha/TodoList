import 'package:flutter/material.dart'; //material Android
import 'package:flutter/cupertino.dart';
import 'package:TodoList/models/item.dart'; //material IOS

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //sempre o material app primeiro, e em seguida o theme o theme e home
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  //lista de itens que vai pegar do json
  var items = new List<Item>();

  HomePage() {
    items = [];
    items.add(Item(title: "Banana", done: false));
    items.add(Item(title: "Abacate", done: true));
    items.add(Item(title: "Laranja", done: false));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //scaffold representa uma pagina (usar sempre que tem pagina)
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        //user o ListView.builder (builder atualiza conforme a criacao de novos items)
        itemCount: widget.items.length, //pega o tamanho do array de items
        itemBuilder: (BuildContext ctxt, int index) {
          //o que vai desenhar ()
          final item = widget.items[index];
          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value: item.done,
            onChanged: (value) {
              print(value);
            },
          );
        },
      ),
    );
  }
}
