import 'package:flutter/material.dart';

class RsGroupPage extends StatefulWidget {
  const RsGroupPage({super.key});

  @override
  State<RsGroupPage> createState() => _RsGroupPageState();
}

class _RsGroupPageState extends State<RsGroupPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Group Page'),
      ),
    );
  }
}