import 'package:amrap/features/amrap/data/amrap_model.dart';
import 'package:amrap/features/amrap/view_models/amrap_view_model.dart';
import 'package:amrap/features/amrap/view_models/providers/amrap_change_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoundCounter extends ConsumerWidget {
  final void Function()? onTap;
  const RoundCounter({super.key, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch<AmrapViewModel>(amrapChangeNotifierProvider);

    return GestureDetector(
        onTap: provider.counterState == AmrapState.started
            ? provider.addRep
            : null,
        child: SizedBox(
          width: 80,
          height: 60,
          child: Column(
            children: [
              Icon(
                Icons.add_circle_outline,
                color: provider.counterState == AmrapState.started
                    ? Colors.amber
                    : Colors.grey,
                size: 48,
              ),
              const Text(
                "round counter",
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ));
  }
}
