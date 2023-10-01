import 'package:flutter/material.dart';

enum AmrapState {
  init(color: Colors.grey),
  started(color: Colors.amber),
  paused(color: Colors.blue),
  rest(color: Colors.lightBlue),
  finished(color: Colors.green),
  ;

  final Color color;
  const AmrapState({required this.color});
}

enum AmrapDuration {
  s0(seconds: 0, restOnly: true),
  s5(seconds: 5, restOnly: true),
  s10(seconds: 10, restOnly: true),
  s15(seconds: 15),
  s30(seconds: 30),
  s45(seconds: 45),
  m1s0(minutes: 1, seconds: 0),
  m1s15(minutes: 1, seconds: 15),
  m1s30(minutes: 1, seconds: 30),
  m1s45(minutes: 1, seconds: 45),
  m2(minutes: 2, seconds: 0),
  m3(minutes: 3, seconds: 0),
  m5(minutes: 5, seconds: 0),
  m10(minutes: 10, seconds: 0),
  m15(minutes: 15, seconds: 0),
  m30(minutes: 30, seconds: 0),
  m60(minutes: 60, seconds: 0),
  ;

  final int minutes;
  final int seconds;
  final bool restOnly;

  const AmrapDuration(
      {this.minutes = 0, this.seconds = 0, this.restOnly = false});

  Duration getDuration() => Duration(minutes: minutes, seconds: seconds);

  @override
  String toString() {
    if (minutes == 0 && seconds == 0) return "-";
    if (minutes == 1 && seconds == 0) return "$minutes minutes";
    if (minutes == 0 && seconds > 0) return "$seconds seconds";
    if (seconds == 0) return "$minutes mins";
    return "$minutes mins $seconds secs";
  }

  String formatted() {
    if (minutes == 0 && seconds == 0) return "-";
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}

class AmrapModel {
  int index;
  AmrapDuration duration;
  AmrapDuration restDuration;
  List<RepModel> reps;
  AmrapState state;

  AmrapModel({
    required this.index,
    required this.duration,
    required this.restDuration,
    this.reps = const [],
    this.state = AmrapState.init,
  });

  updateDuration(AmrapDuration dur) {
    duration = dur;
  }

  updateRestDuration(AmrapDuration dur) {
    restDuration = dur;
  }
}

class RepModel {
  final int index;
  late Duration start;
  late Duration end;

  RepModel({required this.index});

  Duration getDutaion() {
    return end - start;
  }
}
