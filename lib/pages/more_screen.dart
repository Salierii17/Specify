import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  MorePageState createState() => MorePageState();
}

class MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'More page',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}
