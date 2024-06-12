// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:specify/pages/detail_screen.dart';
import 'package:specify/model/song_details.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<SongDetails> likedSongs =
      List.from(songList.where((song) => song.isLiked));
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: likedSongs.isEmpty
          ? const Center(
              child: Text(
                'No songs added',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                final SongDetails songDetails = likedSongs[index];
                return InkWell(
                  onTap: () async {
                    final updatedSongDetails = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailScreen(
                            songList: likedSongs,
                            currentIndex: index,
                            songDetails: songDetails,
                          );
                        },
                      ),
                    );
                    if (updatedSongDetails != null) {
                      setState(() {
                        songDetails.isLiked = updatedSongDetails.isLiked;
                      });
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 15),
                    height: 80,
                    child: Card(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Image.asset(songDetails.imageAssets,
                                fit: BoxFit.cover),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    songDetails.songName,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    songDetails.artist,
                                    style: const TextStyle(),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: likedSongs.length,
            ),
    );
  }
}
