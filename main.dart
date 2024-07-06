import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groww Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  Future<List<Portfolio>> fetchPortfolio() async {
    final response = await http.get(Uri.parse('http://localhost:3000/portfolio'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((portfolio) => Portfolio.fromJson(portfolio)).toList();
    } else {
      throw Exception('Failed to load portfolio');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groww Portfolio'),
      ),
      body: FutureBuilder<List<Portfolio>>(
        future: fetchPortfolio(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Portfolio> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].stockName),
                  subtitle: Text('Quantity: ${data[index].quantity}, Price: ${data[index].pricePerShare}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

class Portfolio {
  final int id;
  final String stockName;
  final int quantity;
  final double pricePerShare;

  Portfolio({required this.id, required this.stockName, required this.quantity, required this.pricePerShare});

  factory Portfolio.fromJson(Map<String, dynamic> json) {
    return Portfolio(
      id: json['id'],
      stockName: json['stock_name'],
      quantity: json['quantity'],
      pricePerShare: json['price_per_share'],
    );
  }
}
