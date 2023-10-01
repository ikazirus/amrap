import 'package:amrap/core/constants.dart';
import 'package:amrap/features/amrap/data/amrap_model.dart';
import 'package:amrap/features/amrap/views/widgets/amrap_duration_dialog.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  final AmrapModel amrap;
  const TimeWidget({super.key, required this.amrap});

  @override
  Widget build(BuildContext context) {
    bool isFirst = amrap.index != 0;
    return Column(
      children: [
        if (isFirst)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (_) => AmrapDurationDialog(
                    amrap: amrap,
                    isRest: true,
                  ),
                ),
                child: Container(
                  height: 60,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: primaryCol,
                      )),
                  child: Text(
                    amrap.restDuration.formatted(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Text(
                "REST",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                barrierDismissible: true,
                builder: (_) => AmrapDurationDialog(
                  amrap: amrap,
                ),
              ),
              child: Container(
                height: 60,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: primaryCol,
                    )),
                child: Text(
                  amrap.duration.formatted(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            const Text(
              "minutes",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
