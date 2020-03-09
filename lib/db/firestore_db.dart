import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mercadin/models/produto.dart';

class FirestoreDB {
  Firestore _firestore;

  FirestoreDB() {
    _firestore = Firestore.instance;
  }
  
  addProduto(Produto produto) {
    _firestore.collection("produtos").add({
      "nome" : produto.nome,
      "valor" : produto.valor
    });
  }

  recuperarProdutos(_bloc) {
    _firestore.collection("produtos").snapshots().listen(
      (onSnapshot) {
        List<Produto> produtos = List();
        onSnapshot.documents.forEach((DocumentSnapshot documento) {
          Produto produto = Produto(
            id: documento.documentID,
            nome: documento.data['nome'],
            valor: double.parse("${documento.data['valor']}")
          );

          produtos.add(produto);
        });

        _bloc.setStream = produtos;
      }
    );
  }
}
