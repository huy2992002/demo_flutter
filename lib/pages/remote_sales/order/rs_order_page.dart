import 'package:flutter/material.dart';

class RsOrderPage extends StatefulWidget {
  const RsOrderPage({super.key});

  @override
  State<RsOrderPage> createState() => _RsOrderPageState();
}

class _RsOrderPageState extends State<RsOrderPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Order Page'),
      ),
    );
  }
}
