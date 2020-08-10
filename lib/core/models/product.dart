class Product {
  int _id;
  String _nome;
  double _preco;

  int get id => _id;
  String get nome => _nome;
  double get preco => _preco;

  Product(int id, String nome, double preco) {
    this._id = id;
    this._nome = nome;
    this._preco = preco;
  }
}
