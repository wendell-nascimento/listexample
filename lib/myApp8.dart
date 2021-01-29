import 'package:flutter/material.dart';

class MyApp8 extends StatefulWidget {
  @override
  _MyApp8State createState() => _MyApp8State();
}

class _MyApp8State extends State<MyApp8> {

  var _itens = [];

  criarListaDeItens(){
    _itens = [];
     for(int i = 0; i<10;i++){
       Map<String, dynamic> item = Map();
       item["titulo"] = "Titulo $i";
       item["subtitulo"] = "Subtitulo $i";
       _itens.add(item);
     }
  }

  @override
  Widget build(BuildContext context) {
    criarListaDeItens();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(_itens[index]["titulo"]),
              subtitle: Text(_itens[index]["subtitulo"]),
              leading: Icon(Icons.account_box),
              onTap: (){
                print("Indice: $index");

                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text("Título $index", style: TextStyle(color: Colors.blueAccent),),
                        contentPadding: EdgeInsets.all(30),

                        content: Text("Conteúdo de teste do Alert"),

                        actions: [
                          FlatButton(onPressed: (){}, child: Text("Sim")),
                          FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Não")),
                        ],
                      );
                }
                );
              },
            );
          },
        ),
      ),
    );
  }
}