import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloiane/personagens.dart';

List<DocumentSnapshot> personagens = [];


var idD;
var a;
var posters;
var categorias;
var cate =  'agagg';

class Series extends StatefulWidget {
  var id;
  Series(this.id);
  @override
  _SeriesState createState() => _SeriesState(this.id);
}

class _SeriesState extends State<Series> {
  var id;
  _SeriesState(this.id) {
    Atualizar();
    idD = this.id;
  }

  Widget listbuild(BuildContext context, int index) {
    return Stack(children: <Widget>[
      GestureDetector(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Image.network(a[index]['img']),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Personagens(this.id, index)));
        },
      )
    ]);
  }

  Widget listPost(BuildContext context, int index) {
    return Stack(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(5.0),
        child: Image.network(posters[index]),
      )
    ]);
  }

  Atualizar() {
    Firestore.instance.collection('serie').snapshots().listen((data) {
      setState(() {
        personagens = data.documents;
        a = personagens[idD]['personagens'];
        posters = personagens[idD]['posters'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget ListViewPer = new Container(
      margin: EdgeInsets.symmetric(vertical: 0.0),
      height: 200.0,
      child: new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: a.length,
          itemBuilder: listbuild),
    );
    Widget ListPost = new Container(
      margin: EdgeInsets.symmetric(vertical: 0.0),
      height: 200.0,
      child: new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: posters.length,
          itemBuilder: listPost),
    );

     Widget Categorias = new Container(
      child: ListTile(
        leading: Icon(
          Icons.description,
          color: Colors.deepPurple,
        ),
        title: Text('Caregorias'),
        subtitle: Text(''),
      ),
    ); 

    Widget Title = new Container(
      child: ListTile(
        leading: Icon(
          Icons.description,
          color: Colors.deepPurple,
        ),
        title: Text("Resumo"),
        subtitle: Text(personagens[idD]['nome']),
      ),
    );
    Widget PerTitle = new Container(
      child: ListTile(
          leading: Icon(
            Icons.star,
            color: Colors.deepPurple,
          ),
          title: Text("Atores"),
          subtitle: Text("e Personagens")),
    );
    Widget PostTitle = new Container(
        child: ListTile(
      leading: Icon(
        Icons.burst_mode,
        color: Colors.deepPurple,
      ),
      title: Text("Posters"),
    ));

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(personagens[idD]['nome']),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              Container(
                  child: Column(children: <Widget>[
                Image.network(personagens[idD]['poster']),
                Divider(),
                Title,
                Card(
                    margin: EdgeInsets.all(10.0),
                    elevation: 0.0,
                    child: ListBody(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(Icons.videocam)),
                            Padding(
                                padding: EdgeInsets.all(9.0),
                                child: Text(personagens[idD]['season'])),
                            Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(Icons.live_tv)),
                            Padding(
                                padding: EdgeInsets.all(9.0),
                                child: Text(personagens[idD]['produtora'])),
                            Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(Icons.access_alarms)),
                            Padding(
                                padding: EdgeInsets.all(9.0),
                                child: Text(personagens[idD]['time']))
                          ],
                        ),
                        Text(personagens[idD]['descricao'],
                            textAlign: TextAlign.justify),
                      ],
                    )),
                    Categorias,
                PerTitle,
                ListViewPer,
                PostTitle,
                ListPost
              ]))
            ])));
  }
}
