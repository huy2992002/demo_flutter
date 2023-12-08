import 'package:flutter/material.dart';

class RsCustomerPage extends StatefulWidget {
  const RsCustomerPage({super.key});

  @override
  State<RsCustomerPage> createState() => _RsCustomerPageState();
}

class _RsCustomerPageState extends State<RsCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Customer Page'),
      ),
    );
  }
}
