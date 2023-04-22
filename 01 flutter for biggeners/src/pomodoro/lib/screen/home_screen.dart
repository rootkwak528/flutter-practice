import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int twentyFiveMinutes = 10;

  late int totalSeconds;
  late int totalPomodoros;
  late bool isRunning;

  Timer? timer;

  @override
  void initState() {
    totalSeconds = twentyFiveMinutes;
    totalPomodoros = 0;
    isRunning = false;
    super.initState();
  }

  void onTick(Timer timer) {
    setState(() {
      totalSeconds -= 1;
      if (totalSeconds == 0) {
        pause();
        totalSeconds = twentyFiveMinutes;
        totalPomodoros += 1;
      }
    });
  }

  void onStartPressed() {
    start();
  }

  void onPausedPressed() {
    pause();
  }

  void onResetPressed() {
    reset();
  }

  void start() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void pause() {
    timer?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void reset() {
    if (timer != null) {
      timer?.cancel();
    }
    setState(() {
      totalSeconds = twentyFiveMinutes;
      isRunning = false;
    });
  }

  String formatTime() {
    var minute = (totalSeconds / 60).floor().toString().padLeft(2, '0');
    var second = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minute:$second';
  }

  String formatTime2() {
    var duration = Duration(seconds: totalSeconds);
    return duration.toString().split('.')[0].substring(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                formatTime2(),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 100,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 100,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausedPressed : onStartPressed,
                    icon: isRunning
                        ? const Icon(Icons.pause_circle)
                        : const Icon(Icons.play_circle),
                  ),
                  IconButton(
                    iconSize: 100,
                    color: Theme.of(context).cardColor,
                    onPressed: onResetPressed,
                    icon: const Icon(Icons.replay_circle_filled),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
