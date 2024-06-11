import 'dart:math' as math;
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:video_player/video_player.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  MorePageState createState() => MorePageState();
}

class MorePageState extends State<MorePage> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  Future<void> initializeVideoPlayer() async {
    videoPlayerController = VideoPlayerController.asset(
      'assets/video/final_exam.mp4',
    );

    try {
      await videoPlayerController.initialize();
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: false,
        looping: true,
      );
      setState(() {});
    } catch (e) {
      print("Error initializing video player: $e");
    }
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!videoPlayerController.value.isInitialized) {
      return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(),
        child: SafeArea(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("About"),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GradientAnimationText(
                      text: Text(
                        'Sulthan Zimran Alrazzaq',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      colors: [
                        Color(0xFF061A9C),
                        Color(0xff92effd),
                      ],
                      duration: Duration(seconds: 5),
                      transform: GradientRotation(math.pi / 4),
                    ),
                    SizedBox(height: 8),
                    GradientAnimationText(
                      text: Text(
                        '012202200052',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      colors: [
                        Color(0xFF061A9C),
                        Color(0xff92effd),
                      ],
                      duration: Duration(seconds: 5),
                      transform: GradientRotation(math.pi / 4),
                    ),
                    SizedBox(height: 10),
                    GradientAnimationText(
                      text: Text(
                        'Demonstration Video',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      colors: [
                        Color(0xFF061A9C),
                        Color(0xff92effd),
                      ],
                      duration: Duration(seconds: 5),
                      transform: GradientRotation(math.pi / 4),
                    ),
                    SizedBox(height: 1),
                  ],
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: videoPlayerController.value.aspectRatio,
                  child: Chewie(controller: chewieController),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
