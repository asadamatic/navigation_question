import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ScreenA(),
    );
  }
}

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen A'),
      ),
      body: ElevatedButton(
        child: Text('Navigate to Screen B'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => ScreenB()));
        },
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen B'),
      ),
      body: ElevatedButton(
        child: Text('Navigate to Screen C'),
        onPressed: () async {
          log('Replacing Screen C by Screen D');
          await Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => ScreenC()));
          log('Expecting this to get printed, when Screen C is Popped or Replaced.');
        },
      ),
    );
  }
}

class ScreenC extends StatelessWidget {
  const ScreenC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen C'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('Pop Screen C'),
            onPressed: ()  {
              log('Popping Screen D');
              Navigator.pop(context);
            },
          ),
          ElevatedButton(
            child: Text('Replace Screen C by Screen D'),
            onPressed: () async {
              log('Replacing Screen C by Screen D');
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ScreenD()));
            },
          ),
        ],
      ),
    );
  }
}

class ScreenD extends StatelessWidget {
  const ScreenD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen D'),
      ),
      body: ElevatedButton(
        child: Text('Pop Screen D'),
        onPressed: ()  {
          log('Popping Screen D');
          Navigator.pop(context);
        },
      ),
    );
  }
}
