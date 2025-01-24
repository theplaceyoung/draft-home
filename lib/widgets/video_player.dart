import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final bool isLooping;
  final bool autoPlay;

  const VideoPlayerWidget({
    required this.videoUrl,
    this.isLooping = false,
    this.autoPlay = false,
    Key? key,
  }) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // VideoPlayerController 초기화
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..setLooping(widget.isLooping) // 반복 설정
      ..setVolume(1.0); // 음량 설정

    // 비디오 초기화
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      if (widget.autoPlay) {
        _controller.play(); // 자동으로 재생
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // 메모리 해제
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // 로딩 상태
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}')); // 에러 처리
        } else {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        }
      },
    );
  }
}
