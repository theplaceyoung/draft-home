import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CanvasWebPage extends StatefulWidget {
  @override
  _CanvasWebPageState createState() => _CanvasWebPageState();
}

class _CanvasWebPageState extends State<CanvasWebPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // JavaScript 허용
      ..addJavaScriptChannel(
        'FlutterChannel',
        onMessageReceived: (message) {
          // HTML에서 보내온 메시지 처리
          print('Received message from HTML: ${message.message}');
        },
      )
      ..loadRequest(Uri.parse('http://your-local-server-or-deployment.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTML Canvas Drawing'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveCanvas, // Flutter에서 HTML로 메시지 전송
          ),
        ],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }

  // Flutter에서 JavaScript 함수 호출
  void _saveCanvas() {
    _controller.runJavaScript('saveCanvas()'); // saveCanvas는 HTML에서 정의된 함수
  }

  // 초기화
  void _initializeCanvas() {
    _controller.runJavaScript('initializeCanvas()'); // 캔버스 상태 저장, 초기화 함수
  }
}
