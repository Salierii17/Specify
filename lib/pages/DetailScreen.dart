// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:specify/model/songDetails.dart';
import 'package:assets_audio_player/assets_audio_player.dart';


class DetailScreen extends StatefulWidget {
  final List<SongDetails> songList; 
  int currentIndex;
  final SongDetails songDetails;

  DetailScreen({
    Key? key,
    required this.songList,
    required this.currentIndex,
    required this.songDetails,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool isPlaying = false;
  Duration currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.realtimePlayingInfos.listen((info) {
      setState(() {
        currentPosition = info.currentPosition;
      });
    });
  }

  void _loadAudio() {
    final SongDetails currentSong = widget.songList[widget.currentIndex];
    final assetPath = currentSong.songUrl;

    assetsAudioPlayer.open(
      Audio(
        assetPath,
        metas: Metas(
          title: currentSong.songName,
          artist: currentSong.artist,
          image: MetasImage.asset(currentSong.imageAssets),
        ),
      ),
      showNotification: true,
    ); 
  }

  @override
  void dispose() {
    assetsAudioPlayer
        .dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 30),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25, 25, 20, 20),
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/icons/back.png")),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Spacer(),
              const GradientAnimationText(
                text: Text(
                  'Now Playing',
                  style: TextStyle(
                    fontSize: 20,
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
              const Spacer(),
              Container(
                padding: const EdgeInsets.fromLTRB(25, 25, 20, 20),
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/icons/list.png")),
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(50),
            height: 350,
            width: 350,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/disk.png'))),
            child: CircleAvatar(
              backgroundImage: AssetImage(widget.songDetails.imageAssets),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.songDetails.songName,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formatDuration(currentPosition),
                style: const TextStyle(color: Colors.black),
              ),
              SliderTheme(
                data: const SliderThemeData(
                  trackHeight: 8.0,
                ),
                child: Slider.adaptive(
                  value: currentPosition.inSeconds.toDouble(),
                  onChanged: (value) {
                    assetsAudioPlayer.seek(Duration(seconds: value.toInt()));
                  },
                  min: 0,
                  max: widget.songDetails.duration.toDouble(),
                  activeColor: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                right: 50,
                child: IconButton(
                  icon: Icon(
                    widget.songDetails.isLiked
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.songDetails.isLiked = !widget.songDetails.isLiked;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () {

                    },
                    icon: Image.asset(
                      'assets/images/rewind.png', 
                      width: 40,
                      height: 40,
                    ),
                  ),
                  IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    iconSize: 40.0,
                    onPressed: () async {
                      if (isPlaying) {
                        assetsAudioPlayer.pause();
                      } else {
                        _loadAudio();
                        assetsAudioPlayer.play();
                      }
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                  IconButton(
                    onPressed: () {
                    },
                    icon: Image.asset(
                      'assets/images/forward.png', 
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
