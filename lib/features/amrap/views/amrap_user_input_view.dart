import 'package:amrap/core/constants.dart';
import 'package:amrap/core/routes.dart';
import 'package:amrap/features/amrap/view_models/amrap_view_model.dart';
import 'package:amrap/features/amrap/view_models/providers/amrap_change_notifier_provider.dart';
import 'package:amrap/features/amrap/views/widgets/amrap_widget.dart';
import 'package:amrap/features/amrap/views/widgets/time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmrapUserInputView extends ConsumerWidget {
  const AmrapUserInputView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AmrapViewModel provider = ref.watch(amrapChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (provider.amraps.length <= 1) const Spacer(flex: 1),
            Expanded(
              flex: 2,
              child: ListView(
                children: [
                  Text(
                    provider.amraps.length > 1
                        ? "${provider.amraps.length} x AMRAP"
                        : "AMRAP",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "As many rounds as possible in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TimeWidget(amrap: provider.amraps[0]),
                  const SizedBox(
                    height: 12,
                  ),
                  if (provider.amraps.length > 1)
                    ...List.generate(
                      provider.amraps.length - 1,
                      (index) => AmrapWidget(
                        amrap: provider.amraps[index + 1],
                      ),
                    ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () => provider.addAmrap(),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.grey,
                          size: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text("Add another AMRAP"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.note_alt_outlined,
                    color: Colors.grey,
                    size: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text("Add notes"),
                  ),
                  if (true)
                    Icon(
                      Icons.check,
                      color: Colors.amber,
                      size: 16,
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            GestureDetector(
              onTap: () => Routes.router.goNamed(Routes.amrapTimer),
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 48.0),
                  decoration: BoxDecoration(
                    color: primaryCol,
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "START TIMER",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(
                        "Total Time: ${provider.getTotalPlannedTime()}",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 10.0),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
