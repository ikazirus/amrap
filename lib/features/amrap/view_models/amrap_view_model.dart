import 'package:amrap/features/amrap/data/amrap_model.dart';
import 'package:flutter/material.dart';

class AmrapViewModel extends ChangeNotifier {
  List<AmrapModel> amraps = [
    AmrapModel(
      index: 0,
      duration: AmrapDuration.m2,
      restDuration: AmrapDuration.s0,
    ),
  ];
  String? notes;
  AmrapState counterState = AmrapState.init;
  Duration counterCurrentDuration = Duration.zero;

  addAmrap() {
    var amrap = AmrapModel(
      index: amraps.length,
      duration: AmrapDuration.m2,
      restDuration: AmrapDuration.s10,
    );
    amraps.add(amrap);
    reassignIndexes();
    notifyListeners();
  }

  removeAmrap(int index) {
    var amrap = amraps.where((element) => element.index == index).first;
    amraps.remove(amrap);
    reassignIndexes();
    notifyListeners();
  }

  reassignIndexes() {
    if (amraps.length > 1) {
      for (var i = 1; i < amraps.length; i++) {
        amraps[i].index = i;
      }
    }
  }

  updateAmrap(int index, AmrapDuration duration, bool isRest) {
    if (index == 0) {
      amraps[0].duration = duration;
      amraps[0].restDuration = AmrapDuration.s0;
    } else {
      if (!isRest) {
        amraps[index].duration = duration;
      } else {
        amraps[index].restDuration = duration;
      }
    }
    notifyListeners();
  }

  String getTotalPlannedTime() {
    Duration duration = Duration.zero;
    for (var amrap in amraps) {
      duration += amrap.duration.getDuration();
    }
    String d = duration.toString();
    return d.split('.000000')[0];
  }

  //Timer
  void startCounting() {}

  void pauseCounting() {}

  void addRep() {}
}
