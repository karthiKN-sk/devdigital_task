import 'package:devdigital_task/utils/extension.dart';
import 'package:devdigital_task/widgets/timer.dart';
import 'package:flutter/material.dart';

class TimerController extends ChangeNotifier {
  final _listWidget = <TimerWidget>[];
  List<TimerWidget> get listWidget => _listWidget;

  void removeItems(String itemsID) {
    _listWidget.removeWhere((element) => element.model.iD == itemsID);
    notifyListeners();
  }

  void updateItems(String itemsID, String remainingTime, bool startOrStop) {
    if (_listWidget.isNotEmpty) {
      int index =
          _listWidget.indexWhere((element) => element.model.iD == itemsID);
      var now = Duration(seconds: remainingTime.toInt());
      _listWidget[index].model.startStop = startOrStop;
      _listWidget[index].model.duration = now;
      notifyListeners();
    }
  }
}
