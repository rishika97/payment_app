import 'package:flutter/material.dart';
import 'package:payment_app/loader_page.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<Transaction> _transactions = [
    Transaction(
      name: "Product 7893",
      price: 2456.98,
      store: "Best Buy",
      returnTime: "3 Weeks 1 Day",
      address: '1342 Colorado Street, Suite 32-92003',
    ),
    Transaction(
      name: 'Ueno Coffee Filters',
      price: 5.03,
      store: 'Target',
    ),
    Transaction(
        name: "Coffee Beans (1kg)",
        price: 12.79,
        store: "Target",
        returnTime: "30 Days"),
    Transaction(
        name: "Wireless Headphones",
        price: 79.99,
        store: "Walmart",
        returnTime: "1 Week"),
    Transaction(
        name: "Hiking Boots",
        price: 159.95,
        store: "REI",
        returnTime: "One Year"),
  ];

  List<Transaction> _filteredTransactions = [];

  @override
  void initState() {
    super.initState();
    _filteredTransactions = _transactions;
  }

  void _filterTransactions(String query) {
    setState(() {
      _filteredTransactions = _transactions
          .where((transaction) =>
              transaction.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              color: const Color.fromARGB(200, 239, 240, 244),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.notifications),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://via.placeholder.com/300"),
                                radius: 30,
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, top: 7),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hi, Rishika',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "Here's your spending dashboard",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\$204.05',
                                    style: TextStyle(fontSize: 20)),
                                Text('Your Balance',
                                    style: TextStyle(fontSize: 8)),
                              ],
                            ),
                            Text(
                              '|',
                              style: TextStyle(fontSize: 30),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('30', style: TextStyle(fontSize: 20)),
                                Text('Last Days',
                                    style: TextStyle(fontSize: 8)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Text('Send Again'),
                    const PayAgain(),
                  ]),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) => _filterTransactions(value),
                    decoration: const InputDecoration(
                      hintText: 'Search Transactions',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.37,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filteredTransactions.length,
                      itemBuilder: (context, index) {
                        final transaction = _filteredTransactions[index];
                        return ListTile(
                          title: Text(transaction.name ?? ""),
                          subtitle: Text(
                              '${transaction.store} - \$${transaction.price?.toStringAsFixed(2)}'),
                          trailing: Text(transaction.returnTime ?? ""),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Transaction {
  final String? name;
  final double? price;
  final String? store;
  final String? returnTime;
  final String? address;

  Transaction(
      {this.name, this.price, this.store, this.returnTime, this.address});
}

class PayAgain extends StatefulWidget {
  const PayAgain({
    super.key,
  });

  @override
  State<PayAgain> createState() => _PayAgainState();
}

class _PayAgainState extends State<PayAgain> {
  final List<Map<String, dynamic>> data = [
    {
      "name": "Johnny Chimpo",
      "image": "https://via.placeholder.com/300" // Replace with image URL
    },
    {
      "name": "Gail Mcnett",
      "image": "https://via.placeholder.com/300" // Replace with image URL
    },
    {
      "name": "Vanessa Kopp",
      "image": "https://via.placeholder.com/300" // Replace with image URL
    },
    {
      "name": "Delores Rathbun",
      "image": "https://via.placeholder.com/300" // Replace with image URL
    },
    {
      "name": "Rochel Deshong",
      "image": "https://via.placeholder.com/300" // Replace with image URL
    },
  ];

  bool _isLoading = false;

  void handlePayment() {
    setState(() {
      _isLoading = true;
    });

    // Simulate payment process delay
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
        // Show completion message
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Payment completed!'),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.14,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length, // Change it according to your need
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: GestureDetector(
              onTap: () {
                _isLoading
                    ? const CircularProgressIndicator() // Loading animation
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AnimationScreen()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(data[index]['image']),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${data[index]['name']}',
                    style: const TextStyle(fontSize: 8),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
