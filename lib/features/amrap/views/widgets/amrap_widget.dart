import 'package:amrap/features/amrap/data/amrap_model.dart';
import 'package:amrap/features/amrap/view_models/amrap_view_model.dart';
import 'package:amrap/features/amrap/view_models/providers/amrap_change_notifier_provider.dart';
import 'package:amrap/features/amrap/views/widgets/time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmrapWidget extends ConsumerWidget {
  final AmrapModel amrap;
  const AmrapWidget({
    super.key,
    required this.amrap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AmrapViewModel provider = ref.watch(amrapChangeNotifierProvider);

    var borderSide = const BorderSide(
      color: Colors.grey,
      width: 2,
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 20,
            height: 220,
            decoration: BoxDecoration(
              border: BorderDirectional(
                start: borderSide,
                top: borderSide,
                bottom: borderSide,
              ),
            ),
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => provider.removeAmrap(amrap.index),
              child: const Icon(
                Icons.close,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            width: 280,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${amrap.index + 1}. AMRAP (${amrap.duration.toString()})",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TimeWidget(amrap: amrap),
              ],
            ),
          ),
          Container(
            width: 20,
            height: 220,
            decoration: BoxDecoration(
              border: BorderDirectional(
                end: borderSide,
                top: borderSide,
                bottom: borderSide,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
