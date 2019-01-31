import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloiane/series.dart';

void main() => runApp(MyApp());

List<DocumentSnapshot> itens = [];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TV Shows',
      home: Scaffold(
        appBar: AppBar(
          title: Text("TV Shows"),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: MyList(),
      ),
    );
  }
}

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  _MyListState() {
    Atualizar();
  }

  Widget listBuild(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Image.network(itens[index]['img']),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Series(index)));
                    
          },
        )
      ],
    );
  }

  Atualizar() {
    Firestore.instance
        .collection('serie')
        .snapshots()
        .listen((data) {
      setState(() {
        itens = data.documents;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 200.0,
            child: new ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: itens.length,
              itemBuilder: listBuild,
            ),
          ),
        )
      ],
    );
  }
}