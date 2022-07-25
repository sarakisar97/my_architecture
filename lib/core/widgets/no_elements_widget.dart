import 'package:flutter/material.dart';

class NoElementsWidget extends StatelessWidget {
  const NoElementsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No Elements'));
  }
}
