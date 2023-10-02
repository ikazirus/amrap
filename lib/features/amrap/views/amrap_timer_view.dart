import 'package:amrap/features/amrap/view_models/amrap_view_model.dart';
import 'package:amrap/features/amrap/view_models/providers/amrap_change_notifier_provider.dart';
import 'package:amrap/features/amrap/views/widgets/custom_progress_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmrapTimerView extends ConsumerWidget {
  const AmrapTimerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch<AmrapViewModel>(amrapChangeNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("AmrapTimer Screen")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              provider.amraps.length > 1
                  ? "${provider.activeAmrapIndex + 1} of ${provider.amraps.length}"
                  : provider.amraps[0].duration.toString(),
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (provider.amraps.length > 1)
              Text(
                provider.activeAmrap.duration.toString(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(
              width: double.infinity,
              height: 16,
            ),
            AmrapTimerWidget(
              width: MediaQuery.of(context).size.width * .9,
            ),
          ],
        ),
      ),
    );
  }
}
