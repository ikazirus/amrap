import 'package:amrap/features/amrap/views/widgets/custom_progress_widget.dart';
import 'package:amrap/core/constants.dart';
import 'package:flutter/material.dart';

class AmrapTimerView extends StatelessWidget {
  const AmrapTimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AmrapTimer Screen")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            AmrapTimerWidget(
              value: 100,
              milliSeconds: 6000,
              width: 240,
              color: primaryCol,
            ),
          ],
        ),
      ),
    );
  }
}
