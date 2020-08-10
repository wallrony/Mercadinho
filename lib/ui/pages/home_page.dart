import 'package:flutter/material.dart';
import 'package:mercadinho/core/models/product.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> selectedIds = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.local_grocery_store,
        ),
        onPressed: calculateBuy,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(248),
                ),
              ),
              padding: EdgeInsets.only(left: 16, top: 96, bottom: 24),
              child: Text(
                'Mercadinho',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: makeProductList(),
            ),
          ],
        ),
      ),
    );
  }

  List<Product> getProducts() {
    return [
      Product(0, "Feijão", 25),
      Product(1, "Treloso", 6),
      Product(2, "Carne", 1),
      Product(3, "Café", 5),
      Product(4, "Limão", 15),
    ];
  }

  makeProductList() {
    return ListView(
      children: <Widget>[
        for (Product product in getProducts()) makeProductItem(product),
      ],
    );
  }

  makeProductItem(Product product) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 4, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (selectedIds.contains(product.id)) {
                    selectedIds.remove(product.id);
                  } else {
                    selectedIds.add(product.id);
                  }

                  setState(() {});
                },
                child: ClipRRect(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 150),
                    margin: EdgeInsets.only(right: 16),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(248),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          color: selectedIds.contains(product.id)
                              ? Colors.blue[600]
                              : Colors.black26,
                          offset: Offset(1, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                "${product.nome} - ",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black87,
                ),
              ),
              Text(
                "${product.preco}",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }

  calculateBuy() {
    List<Product> products = getProducts();
    double total = 0;

    for (Product product in products) {
      if (selectedIds.contains(product.id)) {
        total += product.preco;
      }
    }

    Toast.show(
      "O total da compra é $total",
      context,
      textColor: Colors.white,
      backgroundColor: Colors.cyan,
    );
  }
}
