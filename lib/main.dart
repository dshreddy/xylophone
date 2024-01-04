import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my xylophone',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "My Xylophone",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: const SafeArea(child: AppBody()),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  final player = AudioPlayer();

  void playSound(int soundNumber) async {
    await player.stop();
    await player.setSource(AssetSource('note$soundNumber.wav'));
    await player.resume();
  }

  Expanded buildKey({required Color color_, required int soundNumber}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          playSound(soundNumber);
        },
        child: Container(
          color: color_,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildKey(color_: Colors.red, soundNumber: 1),
        buildKey(color_: Colors.orange, soundNumber: 2),
        buildKey(color_: Colors.yellow, soundNumber: 3),
        buildKey(color_: Colors.green, soundNumber: 4),
        buildKey(color_: Colors.teal, soundNumber: 5),
        buildKey(color_: Colors.blue, soundNumber: 6),
        buildKey(color_: Colors.purple, soundNumber: 7),
      ],
    );
  }
}
