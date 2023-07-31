import 'package:flutter/material.dart';

class ODOSSystemList extends StatelessWidget {
  const ODOSSystemList({super.key});

  //기본적인 틀만 만들었음.
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("category"),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              Container(
                  height: 50,
                  color: Colors.amber[600],
                  child: const Center(child: Text('11111'))),
              Container(
                  height: 50,
                  color: Colors.amber[500],
                  child: const Center(child: Text('22222'))),
              Container(
                  height: 50,
                  color: Colors.amber[400],
                  child: const Center(child: Text('33333')))
            ],
          ),
        ),
      ],
    );
  }
}
