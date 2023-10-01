import 'package:amrap/core/components/circle_progress_custom_painter.dart';
import 'package:amrap/features/amrap/views/widgets/counter_center_widget.dart';
import 'package:amrap/features/amrap/views/widgets/round_counter.dart';
import 'package:flutter/material.dart';

class AmrapTimerWidget extends StatefulWidget {
  final double value;
  final int milliSeconds;
  final double width;
  final Widget? centerWidget;
  final Color color;

  const AmrapTimerWidget({
    Key? key,
    this.value = 0,
    this.milliSeconds = 2500,
    this.width = 100,
    this.centerWidget,
    this.color = Colors.amber,
  }) : super(key: key);

  @override
  State<AmrapTimerWidget> createState() => _AmrapTimerWidgetState();
}

class _AmrapTimerWidgetState extends State<AmrapTimerWidget>
    with TickerProviderStateMixin {
  late AnimationController counterAnimationController;
  late Animation<double> counterAnimation;

  late AnimationController initAnimationController;
  late Animation<double> initAnimation;

  @override
  void initState() {
    super.initState();
    initAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2000,
      ),
    );

    counterAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.milliSeconds,
      ),
    );

    initAnimation =
        Tween<double>(begin: 0, end: 100).animate(initAnimationController)
          ..addListener(() {
            setState(() {});
          });

    counterAnimation = Tween<double>(begin: 0, end: widget.value)
        .animate(counterAnimationController)
      ..addListener(() {
        setState(() {});
      });

    initAnimationController.forward();
  }

  @override
  void dispose() {
    counterAnimationController.dispose();
    initAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double lerpVal = counterAnimation.value / widget.value;
    final Size size = Size(widget.width, widget.width);

    return SizedBox(
      height: size.height + 20,
      width: size.width + 20,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              right: 4,
              bottom: 4,
              child: RoundCounter(
                onTap: () => counterAnimationController.forward(),
              )),
          AnimatedPositioned(
            duration: const Duration(
              seconds: 1,
            ),
            curve: Curves.elasticIn,
            left: initAnimation.isCompleted ? null : -(size.width),
            width: widget.width / 2,
            child: CounterCenterWidget(
                size: Size(widget.width / 2, widget.width / 2)),
          ),
          CustomPaint(
            foregroundPainter: CircleProgressPainter(
              currentProgress: counterAnimation.value,
              color: Color.lerp(Colors.red, Colors.green, lerpVal)!,
              gradient: Gradient.lerp(
                  const LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  const LinearGradient(
                    colors: [
                      Colors.deepOrange,
                      Colors.amberAccent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  lerpVal)!,
              strokeWidth: 8,
            ),
            child: Container(
              width: widget.width,
              height: widget.width,
              alignment: Alignment.center,
              child: Text(
                counterAnimation.value.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 8.0,
                      color: widget.color,
                      offset: Offset.zero,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
