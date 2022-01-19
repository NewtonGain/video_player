import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(const VideoApp());

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://rr4---sn-g5qp5oucq-q5js.googlevideo.com/videoplayback?expire=1642619000&ei=GAzoYaL2Cu6X4t4Pxq688A4&ip=210.1.246.146&id=o-AO9YgO8v944HhTn3DBmA6gIkV8GOmP9z7WMjKNDANaRA&itag=22&source=youtube&requiressl=yes&mh=wD&mm=31%2C29&mn=sn-g5qp5oucq-q5js%2Csn-npoe7ne7&ms=au%2Crdu&mv=m&mvi=4&pl=24&pcm2=no&gcr=bd&initcwndbps=513750&vprv=1&mime=video%2Fmp4&ns=3pTe89Imyz3e5I71YBu8v78G&ratebypass=yes&dur=218.546&lmt=1628948926697118&mt=1642597020&fvip=4&fexp=24001373%2C24007246&c=WEB&txp=5532434&n=yYxdc1h6P19qQQ&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cpcm2%2Cgcr%2Cvprv%2Cmime%2Cns%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIhAL3wwBi97t1DT-Ywwsipu7gOP_qfV2aB9YsInKwxEDzIAiBA4VNuTrccaTmUR9aW4DOO7JJ5nKQcXQIJ-eKYwrRRMQ%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRgIhAKI5_1M65WzZ06ukxHT6IbJd1L5hO039uMM9OQ_nfCq8AiEA0Rd0asK4K5fiHwooZJ_-_sGd56eboyVcbqcK3igM-a8%3D&title=Ishq%20Hai%20OST%20%7C%20Rahat%20Fateh%20Ali%20Khan%20%7C%20Danish%20Taimoor%20%7C%20Minal%20Khan%20%7C%20ARY%20Digital')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Demo',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
