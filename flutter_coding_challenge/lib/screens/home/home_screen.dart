import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/screens/widgets/gridview_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
          centerTitle: true,
        ),
        body: gridView_builder(),
      ),
    );
  }
}
