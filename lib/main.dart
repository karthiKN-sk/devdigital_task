import 'package:devdigital_task/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/timer_controller.dart';
import 'views/homepage_timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TimerController>(
            create: (_) => TimerController()),
      ],
      child: MaterialApp(
        title: 'Flutter Timer App For InterView With Markowate',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeData,
        home: const MyHomePage(),
      ),
    );
  }
}
