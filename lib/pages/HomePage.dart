// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:specify/pages/DetailScreen.dart';
import 'package:specify/model/songDetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SongDetails> filteredSongs = List.from(songList);
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void filterSongs(String query) {
    setState(() {
      filteredSongs = songList
          .where((song) =>
              song.songName.toLowerCase().contains(query.toLowerCase()) ||
              song.artist.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Discover",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.sort_sharp,
                        color: Colors.grey,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 15, left: 5, bottom: 20),
                child: Container(
                  height: 50,
                  width: 380,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        height: 50,
                        width: 200,
                        child: TextFormField(
                          controller: searchController,
                          onChanged: (query) {
                            filterSongs(query);
                          },
                          decoration: const InputDecoration(
                              hintText: "Search the music",
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(left: 5),
                child: Transform.rotate(
                  angle: 0 * (3.141592653589793 / 180),
                  child: const Text(
                    'My Playlist',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5, left: 50, right: 0, bottom: 20),
                child: SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildImageWithOverlay(
                        "assets/images/relax.jpg",
                        "Chill",
                        Icons.play_arrow_outlined,
                      ),
                      _buildImageWithOverlay(
                        "assets/images/pop.jpeg",
                        "Pop",
                        Icons.play_arrow_outlined,
                      ),
                      _buildImageWithOverlay(
                        "assets/images/trending.jpg",
                        "Trending",
                        Icons.play_arrow_outlined,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final SongDetails songDetails = filteredSongs[index];
                    return InkWell(
                      onTap: () {
                        int originalIndex =
                            songList.indexOf(filteredSongs[index]);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailScreen(
                                songList: songList,
                                currentIndex: originalIndex,
                                songDetails: filteredSongs[index],
                              );
                            },
                          ),
                        );
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                  itemCount: filteredSongs.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildImageWithOverlay(
    String imagePath, String text, IconData iconData) {
  return Padding(
    padding: const EdgeInsets.only(left: 4, right: 50),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(imagePath),
        ),
        Positioned(
          bottom: 10,
          left: 15,
          right: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Icon(
                  iconData,
                  color: Colors.black,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
