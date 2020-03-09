import 'package:flutter/material.dart';
import 'package:mercadin/blocs/produtos_bloc.dart';
import 'package:mercadin/db/firestore_db.dart';
import 'package:mercadin/widgets/lista_de_produtos.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirestoreDB db = FirestoreDB();
  ProdutoBloc _bloc = ProdutoBloc();

  void initState() {
    super.initState();

    db.recuperarProdutos(_bloc);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mercadinho"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: StreamBuilder(
        stream: _bloc.getStream,
        builder: (context, snapshot) {
          return ListaDeProdutos(
            produtos: snapshot.data ?? List()
          );
        },
      )
    );
  }
}
