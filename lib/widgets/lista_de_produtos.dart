import 'package:flutter/material.dart';
import 'package:mercadin/models/produto.dart';

class ListaDeProdutos extends StatelessWidget {
  List<Produto> produtos = List();

  ListaDeProdutos({ this.produtos });

  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => listItem(produtos[index]),
      itemCount: produtos.length,
    );
  }

  listItem(item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${item.id}",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            item.nome,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "${item.valor}",
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ]
      )
    );
  }
}
