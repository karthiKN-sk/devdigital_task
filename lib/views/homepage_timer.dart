import 'package:devdigital_task/models/timer_model.dart';
import 'package:devdigital_task/widgets/buttonwidget.dart';
import 'package:devdigital_task/widgets/timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/timer_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ThemeData themeData;
  GlobalKey<FormState> timerForm = GlobalKey<FormState>();

  String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    final Size appSize = MediaQuery.sizeOf(context);
    final controller = context.watch<TimerController>();
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.onSecondary,
        title: Text(
          "Count-Down Timer",
          style: themeData.textTheme.headlineMedium!
              .copyWith(color: themeData.colorScheme.background, fontSize: 24),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: KustomButton(
              margin: const EdgeInsets.only(left: 30, right: 30),
              color: themeData.colorScheme.inversePrimary,
              buttondecoration: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              text: Text(
                "Add Timer",
                style: themeData.textTheme.labelLarge!.copyWith(
                    color: themeData.colorScheme.background,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                controller.listWidget.insert(
                    0,
                    TimerWidget(
                      key: Key("Timer${idGenerator()}"),
                      model: TimerModel(
                        iD: idGenerator(),
                        seconds: "",
                        duration: const Duration(seconds: 0),
                        startStop: false,
                      ),
                      controller: controller,
                    ));
                setState(() {});
              },
            ),
          ),
          controller.listWidget.isNotEmpty
              ? Container(
                  width: appSize.width,
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [...controller.listWidget],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
