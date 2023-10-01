import 'package:flutter/material.dart';

class CounterCenterWidget extends StatelessWidget {
  final Size size;
  const CounterCenterWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: size.height,
      width: size.width,
    );
  }
}
