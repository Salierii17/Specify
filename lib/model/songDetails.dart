final class SongDetails {
  String songName;
  String artist;
  int duration;
  String imageAssets;
  String songUrl;
  bool isLiked;

  SongDetails({
    required this.songName,
    required this.artist,
    required this.duration,
    required this.imageAssets,
    required this.songUrl,
    required this.isLiked,
  });
}

var songList = [
  SongDetails(
    songName: 'Last Suprise',
    artist: 'Lyn',
    duration: 241,
    imageAssets: 'assets/images/song_cover/persona_5.jpeg',
    songUrl: 'assets/music/Last_Surprise.mp3',
    isLiked: false,
  ),
  SongDetails(
    songName: 'Fight Song',
    artist: 'Rachel Platten',
    duration: 207,
    imageAssets: 'assets/images/song_cover/Fight_song.jpeg',
    songUrl: 'assets/music/fight_song.mp3', 
    isLiked: false,
  ),
  SongDetails(
    songName: 'Annihilate',
    duration: 234,
    artist: 'Metro Boomin',
    imageAssets: 'assets/images/song_cover/Annihilate.jpeg',
    songUrl: 'assets/music/Annihilate.mp3', 
    isLiked: false,
  ),
  SongDetails(
    songName: 'Calling',
    duration: 234,
    artist: 'Metro Boomin',
    imageAssets: 'assets/images/song_cover/Calling.jpg',
    songUrl: 'assets/music/Calling.mp3', 
    isLiked: false,
  ),
];


