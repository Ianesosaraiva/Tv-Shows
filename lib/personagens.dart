import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var idD;
var per;
List<DocumentSnapshot> personagens = [];
var a;
var info;

class Personagens extends StatefulWidget {
  var id;
  var pers;
  Personagens(this.id, this.pers);
  @override
  _PersonagensState createState() => _PersonagensState(this.id, this.pers);
}

class _PersonagensState extends State<Personagens> {
  var id;
  var pers;
  _PersonagensState(this.id, this.pers) {
    Atualizar();
    idD = this.id;
    per = this.pers;
  }

  Atualizar() {
    Firestore.instance.collection('serie').snapshots().listen((data) {
      setState(() {
        personagens = data.documents;
        a = personagens[idD]['personagens'];
        info = a[per]['informacoes'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget PerLis = new Container(
      child: ListTile(
        title: Text(a[per]['personagem'],
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 150))),
        subtitle: Text(a[per]['descricao']),
      ),
    );
    Widget Info = new Container(
      child: ListTile(
          title: Text("Informações",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromRGBO(0, 0, 0, 150)))),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Tv Shows"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                child: Column(
                    children: <Widget>[Image.network(a[per]['poster'])])),
            Divider(),
            Card(
              margin: EdgeInsets.all(10.0),
              elevation: 0.0,
              child: ListBody(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      a[per]['personagem'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Color.fromRGBO(0, 0, 0, 150)),
                    ),
                  ),
                  Text(a[per]['descricao'], textAlign: TextAlign.justify),
                  Info,
                  Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.work,
                            color: Colors.deepPurple,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Ocupação: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(info['ocupacao'],
                              style: TextStyle(fontStyle: FontStyle.italic)),
                        )
                      ]),
                      Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.person, color: Colors.deepPurple),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Especie: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(info['especie'],
                              style: TextStyle(fontStyle: FontStyle.italic)),
                        )
                      ]),
                      Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.child_friendly,
                              color: Colors.deepPurple),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Nascimento: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(info['nascimento'],
                              style: TextStyle(fontStyle: FontStyle.italic)),
                        )
                      ]),
                      Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child:
                              Icon(Icons.access_time, color: Colors.deepPurple),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Idade: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(info['idade'],
                              style: TextStyle(fontStyle: FontStyle.italic)),
                        )
                      ]),
                      Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.room, color: Colors.deepPurple),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Nacionalidade: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(info['nacionalidade'],
                              style: TextStyle(fontStyle: FontStyle.italic)),
                        )
                      ]),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.people, color: Colors.deepPurple),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text("Gênero: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(info['genero'],
                                style: TextStyle(fontStyle: FontStyle.italic)),
                          )
                        ],
                      ),
                      Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.work,
                            color: Colors.deepPurple,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Intrepretado Por: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(a[per]['ator'],
                              style: TextStyle(fontStyle: FontStyle.italic)),
                        )
                      ]),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
