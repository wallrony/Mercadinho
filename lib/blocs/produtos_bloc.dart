import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mercadin/models/produto.dart';

class ProdutoBloc {
  StreamController produtosStream = StreamController();

  set setStream(List<Produto> produtos) => produtosStream.add(produtos);

  get getStream => produtosStream.stream;
}
