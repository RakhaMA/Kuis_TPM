import 'package:flutter/material.dart';
import 'groceries.dart';

class DetailPage extends StatelessWidget {
  final Groceries grocery;

  const DetailPage({Key? key, required this.grocery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(grocery.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nama: ${grocery.name}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Text(
                  'Harga: ${grocery.price}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Stock: ${grocery.stock}',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: 8.0),
                        Text('Review: ${grocery.reviewAverage}',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: 8.0),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  grocery.description,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Rp. ${grocery.price}'),
                        SizedBox(width: 8.0),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        launch(grocery.productUrl);
                      },
                      child: ElevatedButton(
                        child: Text('BUY NOW'),
                        onPressed: (){
                          launch(grocery.productUrl);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void launch(String productUrl) {}
}
