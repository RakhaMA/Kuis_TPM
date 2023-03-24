import 'package:flutter/material.dart';
import 'groceries.dart';
import 'detail_page.dart';

class ListItemPage extends StatelessWidget {
  const ListItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView.builder(
        itemCount: groceryList.length,
        itemBuilder: (BuildContext context, int index){
          return ItemPlaceCard(groceries: groceryList[index]);
        },
    );
  }
}

class ItemPlaceCard extends StatelessWidget {
  final Groceries groceries;

  const ItemPlaceCard({Key? key, required this.groceries}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(grocery: groceries),
                ),
              );
            },
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.teal,
                  width: 2,
                ),
              ),
              child: PageView.builder(
                itemCount: groceries.productImageUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    groceries.productImageUrls[index],
                    fit: BoxFit.fitWidth,
                  );
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  groceries.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 8.0),
                Text(
                  groceries.storeName,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 8.0),
                Text(
                  groceries.price,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 8.0),
                        Text('Rp. ${groceries.price}'),
                        SizedBox(width: 8.0),
                        Text('Stock: ${groceries.stock}'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  'Discount ${groceries.discount}',
                  style: Theme.of(context).textTheme.overline,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
