import 'package:flutter/material.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:wavenet/wavenet.dart';

class Speech extends StatefulWidget {
  Speech({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SpeechState createState() => new _SpeechState();
}

class _SpeechState extends State<Speech> {
  final textConstructor = "Captain severin";
  final TextToSpeechService _service =
      TextToSpeechService("AIzaSyA1h7D3WEoCiAnqrN0BWX2mkyFcC1rO3tM");
  final audioPlayer = AudioPlayer();

  /// https://cloud.google.com/text-to-speech/docs/voices

  getAudioPlayer(file) {
    audioPlayer.play(DeviceFileSource(file));
  }

  _playDemo() async {
    setState(() {
      if (textConstructor != true) {
        textConstructor;
      } else {
        textConstructor;
      }
    });
    if (kDebugMode) {
      print(textConstructor);
    }
    switch (textConstructor) {
      case "Admiral Venesca Catallia":
        File file = await _service.textToSpeech(
          text: textConstructor.toString(),
          voiceName: "en-US-Wavenet-C",
          languageCode: "en-EN",
          pitch: -2,
          speakingRate: 1.25,
          audioEncoding: "LINEAR16",
        );

        getAudioPlayer(file.path);
        break;
      case "Major Razim":
        File file = await _service.textToSpeech(
          text: textConstructor.toString(),
          voiceName: "en-AU-Wavenet-D",
          languageCode: "en-AU",
          audioEncoding: "LINEAR16",
        );
        getAudioPlayer(file.path);
        break;
      case "Captain severin":
        File file = await _service.textToSpeech(
          text: textConstructor.toString(),
          voiceName: "en-US-Wavenet-J",
          languageCode: "en-EN",
          pitch: 10,
          speakingRate: 1.4,
          audioEncoding: "ALAW",
        );

        getAudioPlayer(file.path);
        break;
      case "Commodore Trevaux":
        File file = await _service.textToSpeech(
          text: textConstructor.toString(),
          voiceName: "en-GB-Wavenet-D",
          languageCode: "en-GB",
          audioEncoding: "LINEAR16",
          pitch: -7,
          speakingRate: 1.2,
        );

        getAudioPlayer(file.path);
        break;
      default:
        File file = await _service.textToSpeech(
          text: textConstructor.toString(),
          voiceName: "en-AU-Wavenet-D",
          languageCode: "en-AU",
          audioEncoding: "MP3",
          pitch: -7,
        );

        getAudioPlayer(file.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Speech"),
        ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              textConstructor.toUpperCase(),
              style: const TextStyle(
                  fontSize: 17.5,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              textConstructor,
              style: const TextStyle(
                fontSize: 17.5,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playDemo,
        tooltip: 'Play Demo',
        child: const Icon(Icons.arrow_right_alt_outlined),
      ),
    );
  }
}
