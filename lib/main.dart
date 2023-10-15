import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dice Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomeAppState(),
    );
  }
}

class MyHomeAppState extends StatefulWidget {
  const MyHomeAppState({Key? key});

  @override
  State<MyHomeAppState> createState() => __MyHomeAppStateState();
}

class __MyHomeAppStateState extends State<MyHomeAppState> {
  int me = 1;
  int ai = 1;
  String winner = "";
  Color snackBarColor = Colors.green;
  SnackBar? snackbar;

  int randomNum() {
    return Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.album_outlined),
        title: const Center(
          child: Text("DICE"),
        ),
        actions: const [Icon(Icons.list_rounded)],
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Winner is: $winner"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('ME'),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          me = randomNum();
                        });
                      },
                      child: Image.asset('images/dice$me.png', width: 100),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text('AI'),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          ai = randomNum();
                          if (me > ai) {
                            winner = "ME";
                            snackBarColor = Colors.green;
                          } else if (me < ai) {
                            winner = "AI";
                            snackBarColor = const Color.fromARGB(255, 219, 12, 12);
                          } else {
                            winner = "DRAW";
                            snackBarColor = const Color.fromARGB(255, 89, 76, 175);
                          }
                          snackbar = SnackBar(
                            content: Text(winner),
                            backgroundColor: snackBarColor,
                            duration: const Duration(seconds: 1),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar!);
                        });
                      },
                      child: Image.asset('images/dice$ai.png', width: 100),
                    )
                  ],
                )
              ],
            ),
          ],
          
        ),
      ),
      backgroundColor: Color.fromARGB(255, 137, 149, 211),
    );
  }
}
