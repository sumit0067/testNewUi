import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_viewer/video_viewer.dart';

class VideoAndAudioPlayer extends StatefulWidget {
  const VideoAndAudioPlayer({Key? key}) : super(key: key);

  @override
  _VideoAndAudioPlayerState createState() => _VideoAndAudioPlayerState();
}

class _VideoAndAudioPlayerState extends State<VideoAndAudioPlayer> {
  final VideoViewerController controller = VideoViewerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
        centerTitle: true,
      ),
      body: Container(
        child: VideoViewer(
          onFullscreenFixLandscape: true,
          style: VideoViewerStyle(
            buffering: CircularProgressIndicator(color: Colors.purpleAccent,),
            // thumbnail: Image.network(
            //   "https://play-lh.googleusercontent.com/aA2iky4PH0REWCcPs9Qym2X7e9koaa1RtY-nKkXQsDVU6Ph25_9GkvVuyhS72bwKhN1P",
            // ),
          ),
          source: {
            "web": VideoSource(
              video: VideoPlayerController.network(
                'http://13.233.233.84/videos/fitness.mp4',
                videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true)
              ),
            ),
          },
        ),
      ),
    );
  }
}
