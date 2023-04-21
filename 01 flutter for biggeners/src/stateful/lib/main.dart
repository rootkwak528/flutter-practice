import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<int> numbers;

  @override
  void initState() {
    super.initState();
    numbers = [];
  }

  @override
  void dispose() {
    super.dispose();
  }

  void increaseCount() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.deepOrange,
          ),
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 100),
                  IconButton(
                    onPressed: increaseCount,
                    icon: const Icon(Icons.add_box_outlined),
                  ),
                  const Text('count'),
                  for (var n in numbers) Text('$n'),
                ],
              ),
              Column(
                children: const [
                  MyLargeTitle(),
                  SizedBox(height: 100),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
