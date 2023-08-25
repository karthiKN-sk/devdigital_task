// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:devdigital_task/controller/timer_controller.dart';
import 'package:devdigital_task/models/timer_model.dart';
import 'package:devdigital_task/theme/app_theme.dart';
import 'package:devdigital_task/utils/extension.dart';
import 'package:devdigital_task/utils/helper.dart';
import 'package:devdigital_task/widgets/buttonwidget.dart';
import 'package:devdigital_task/widgets/snackbars.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final TimerModel model;
  final TimerController controller;
  const TimerWidget({
    Key? key,
    required this.model,
    required this.controller,
  }) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  String remainingTime = "";
  Timer? _timer;
  late bool startStop = false;
  StreamController<String> timerStream = StreamController<String>.broadcast();
  late ThemeData themeData;
  final TextEditingController secondsController = TextEditingController();

  @override
  void initState() {
    if (startStop) {
      timer();
    } else {
      if (_timer != null && _timer!.isActive) _timer!.cancel();
    }
    prepareData();
    super.initState();
  }

  timer() {
    const oneSec = Duration(seconds: 1);
    if (_timer != null && _timer!.isActive) _timer!.cancel();
    _timer = Timer.periodic(oneSec, (Timer timer) {
      try {
        int second = int.tryParse(remainingTime) ?? 0;
        second = second - 1;
        if (second < -1) return;
        remainingTime = second.toString();
        if (second == 0) {
          startStop = false;
          setState(() {});
          timer.cancel();
        }
        if (second == -1) {
          timer.cancel();
          debugPrint('timer cancelled');
        }
        if (second > 0) {
          timerStream.add(remainingTime);
        }
      } catch (e) {
        debugPrint("$e");
      }
    });
    setState(() {});
  }

  @override
  void dispose() {
    try {
      if (_timer != null && _timer!.isActive) _timer!.cancel();
    } catch (e) {
      debugPrint("$e");
    }
    super.dispose();
  }

  prepareData() {
    Duration myDuration = widget.model.duration!;
    remainingTime = myDuration.inSeconds.toString(); // convert to second
//    remainingTime = '10'; // change this value to test for min function
  }

  startOrStop() {
    FocusScope.of(context).unfocus();
    if (secondsController.text.isNotEmpty) {
      if (startStop) {
        start();
      } else {
        stop();
      }
    } else {
      isErrorSnackBar(context, message: "Total Seconds Required");
    }
  }

  start() {
    startStop = false;
    setState(() {});
    if (_timer != null && _timer!.isActive) _timer!.cancel();
    updateMethod();
  }

  stop() {
    timer();
    startStop = true;
    final model = widget.model;
    remainingTime = secondsController.text;
    model.copyWith(
        seconds: secondsController.text,
        duration: Duration(seconds: secondsController.text.toInt()),
        startStop: true);
    setState(() {});
    updateMethod();
  }

  Widget dayHourMinuteSecondFunction(BuildContext context, Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitHours = twoDigits(duration.inHours.remainder(24));
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    );
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: themeData.colorScheme.onSecondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeData.colorScheme.background,
                ),
                height: 40,
                width: MediaQuery.sizeOf(context).width / 5,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Secs",
                    hintStyle: themeData.textTheme.headlineMedium!.copyWith(
                      fontSize: 16,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: FontWeight.normal,
                    ),
                    fillColor: themeData.colorScheme.secondary,
                    enabledBorder: outlineInputBorder,
                    border: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                  style: themeData.textTheme.headlineMedium!.copyWith(
                    fontSize: 18,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
                  autovalidateMode: AutovalidateMode.disabled,
                  controller: secondsController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Seconds Requried";
                    }

                    return null;
                  },
                ),
              ),
              verticalSpace(4),
              Text(
                "Secs",
                style: themeData.textTheme.labelLarge!.copyWith(
                  color: themeData.colorScheme.background,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          _buildMS(twoDigitHours, twoDigitMinutes, twoDigitSeconds),
          KustomButton(
            color: !startStop
                ? themeData.colorScheme.inversePrimary
                : themeData.colorScheme.primary,
            buttondecoration: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            width: MediaQuery.sizeOf(context).width / 4.5,
            text: Text(
              !startStop ? "Start" : "Pause",
              style: themeData.textTheme.bodyMedium!.copyWith(
                  color: themeData.colorScheme.background,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: startOrStop,
          ),
        ],
      ),
    );
  }

  Row _buildMS(
    String twoDigitHours,
    String twoDigitMinutes,
    String twoDigitSeconds,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: themeData.colorScheme.background,
              ),
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 40,
              width: MediaQuery.sizeOf(context).width / 3,
              child: Center(
                child: Text(
                  "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.displayLarge!,
                    fontSize: 18,
                    fontWeight: 800,
                    color: themeData.colorScheme.onTertiary,
                  ),
                ),
              ),
            ),
            verticalSpace(4),
            Text("HH:MM:SS",
                style: themeData.textTheme.labelLarge!.copyWith(
                  color: themeData.colorScheme.background,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ],
    );
  }

  Widget dateWidget() {
    return StreamBuilder<String>(
        key: Key("${widget.model.iD}"),
        stream: timerStream.stream,
        initialData: "0",
        builder: (context, snapshot) {
          Widget remainTimeDisplay = Container();
          try {
            var now = Duration(seconds: remainingTime.toInt());
            Future.delayed(Duration.zero, () async {
              updateMethod();
            });
            remainTimeDisplay = dayHourMinuteSecondFunction(context, now);
          } catch (e) {
            debugPrint("$e");
          }

          return remainTimeDisplay;
        });
  }

  void updateMethod() {
    widget.controller.updateItems(widget.model.iD!, remainingTime, startStop);
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return dateWidget();
  }
}
