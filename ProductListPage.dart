import 'package:flutter/material.dart';
import 'ProductDetailPage.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, String>> products = List.generate(
    36,
    (i) => {
      'title': 'Product ${i + 1}',
      'desc': 'Product description ${i + 1}',
      'image': 'https://picsum.photos/seed/item$i/200/140',
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products list')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Card(
            child: ListTile(
              leading: Image.network(
                item['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(item['title']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailPage(
                      title: item['title']!,
                      description: item['desc']!,
                      imageUrl: item['image']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
