import 'package:amrap/features/amrap/data/amrap_model.dart';
import 'package:amrap/features/amrap/view_models/providers/amrap_change_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterCenterWidget extends ConsumerWidget {
  final Size size;
  const CounterCenterWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(amrapChangeNotifierProvider);
    bool isRest = provider.counterState == AmrapState.rest;
    bool isPaused = provider.counterState == AmrapState.paused;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Icon(
        provider.counterState == AmrapState.paused ||
                provider.counterState == AmrapState.init
            ? Icons.play_arrow_rounded
            : Icons.pause_rounded,
        size: size.height * .7,
        color: Colors.amber,
      ),
    );
  }
}
