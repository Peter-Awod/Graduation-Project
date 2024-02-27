import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoInfo {
  final String videoId;
  final String title;
  final List<ButtonInfo> buttons;

  VideoInfo({
    required this.videoId,
    required this.title,
    required this.buttons,
  });
}

class ButtonInfo {
  final String buttonText;
  final String buttonLink;
  final VoidCallback onPressed;

  ButtonInfo({
    required this.buttonText,
    required this.buttonLink,
    required this.onPressed,
  });
}

class LifeSkillsScreen extends StatelessWidget {
  final List<VideoInfo> videoInfoList = [
    // video 1
    VideoInfo(
      videoId: 'La5sflew6kM',
      title: 'Speech Blubs',
      buttons: [
        ButtonInfo(
          buttonText: 'View website',
          buttonLink: '',
          onPressed: () {
            launch('https://speechblubs.com/');
            // Handle button press for video 1 - App Store button
          },
        ),

      ],
    ),
// video 2
    VideoInfo(
      videoId: '-jcMc_BWk4Q',
      title: 'Pokemon Smile',
      buttons: [
        ButtonInfo(
          buttonText: 'App Store',
          buttonLink: '',
          onPressed: () {
            launch('https://apps.apple.com/us/app/id1512331079');
            // Handle button press for video 2 - Play Store button
          },
        ),
        ButtonInfo(
          buttonText: 'Play Store',
          buttonLink: '',
          onPressed: () {
            launch('https://play.google.com/store/apps/details?id=jp.pokemon.pokemonsmile');
            // Handle button press for video 1 - More Info button
          },
        ),
      ],
    ),
    // Add more videos as needed
    // video 3
    VideoInfo(
      videoId: 'un8P0d756gI',
      title: 'Learn to Read with reading eggs',
      buttons: [
        ButtonInfo(
          buttonText: 'App Store',
          buttonLink: '',
          onPressed: () {
            launch('https://apps.apple.com/gb/app/reading-eggs-learn-to-read/id726696040');
            // Handle button press for video 1 - App Store button
          },
        ),
        ButtonInfo(
          buttonText: 'Play Store',
          buttonLink: '',
          onPressed: () {
            launch('https://play.google.com/store/apps/details?id=com.blake.readingeggs.android');
            // Handle button press for video 1 - More Info button
          },
        ),
      ],
    ),
    // video 4
    VideoInfo(
      videoId: 'ZU_v2Ie2Bao',
      title: 'Daniel Tiger for Parents',
      buttons: [
        ButtonInfo(
          buttonText: 'Play Store',
          buttonLink: '',
          onPressed: () {
            launch('https://play.google.com/store/apps/details?id=org.pbskids.danieltigerforparents&hl=en&gl=US');
            // Handle button press for video 2 - Play Store button
          },
        ),


      ],
    ),
    // Add more videos as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[600],
      appBar: AppBar(
        backgroundColor: Colors.teal[900],

        title: Text('Life Skills'),

      ),
      body: ListView.builder(
        itemCount: videoInfoList.length,
        itemBuilder: (context, index) {
          return VideoItem(videoInfo: videoInfoList[index]);
        },
      ),
    );
  }
}

class VideoItem extends StatefulWidget {
  final VideoInfo videoInfo;

  const VideoItem({Key? key, required this.videoInfo}) : super(key: key);

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoInfo.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false, // Videos won't play automatically
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Text(
          widget.videoInfo.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red,
          progressColors: ProgressBarColors(
            playedColor: Colors.red,
            handleColor: Colors.redAccent,
          ),
          onReady: () {
            // Perform any actions on player ready
          },
        ),
        SizedBox(height: 8),
        Column(
          children: widget.videoInfo.buttons.map((buttonInfo) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[700], //must change

              ),

              onPressed: buttonInfo.onPressed,
              child: Text(buttonInfo.buttonText),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
