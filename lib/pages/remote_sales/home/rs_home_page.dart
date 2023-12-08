import 'package:flutter/material.dart';

class RsHomePage extends StatefulWidget {
  const RsHomePage({super.key});

  @override
  State<RsHomePage> createState() => _RsHomePageState();
}

class _RsHomePageState extends State<RsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/img_background_appbar.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
