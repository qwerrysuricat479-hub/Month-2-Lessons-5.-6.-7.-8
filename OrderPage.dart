import 'package:flutter/material.dart';
import 'package:flutter_2/NavApp/OrderSuccessPage.dart';

class OrderPage extends StatelessWidget {
  final String productTitle;

  OrderPage({required this.productTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order and payment')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your order: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(productTitle),
            SizedBox(height: 24),
            Text(
              'Way of payment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Credit/debit card'),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Online wallet'),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          OrderSuccessPage(productTitle: productTitle),
                    ),
                  );
                },
                child: Text('Pay'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
