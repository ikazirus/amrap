import 'package:amrap/features/amrap/data/amrap_model.dart';
import 'package:amrap/features/amrap/view_models/providers/amrap_change_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmrapDurationDialog extends ConsumerWidget {
  final AmrapModel amrap;
  final bool isRest;
  const AmrapDurationDialog({
    super.key,
    required this.amrap,
    this.isRest = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(amrapChangeNotifierProvider);
    List<AmrapDuration> amrapList = isRest
        ? AmrapDuration.values.where((e) => e.minutes <= 2).toList()
        : AmrapDuration.values.where((e) => e.restOnly == false).toList();

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 200,
        height: 340,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListWheelScrollView(
                itemExtent: 30,
                magnification: 1.2,
                onSelectedItemChanged: (index) => provider.updateAmrap(
                    amrap.index,
                    AmrapDuration.values
                        .where((e) => e == amrapList[index])
                        .first,
                    isRest),
                overAndUnderCenterOpacity: 0.5,
                children: amrapList
                    .map(
                      (e) => Container(
                        height: 30,
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          e.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
