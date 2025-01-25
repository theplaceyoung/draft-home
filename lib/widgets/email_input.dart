import 'package:flutter/material.dart';

class EmailInputWidget extends StatefulWidget {
  final Map<String, Color> colorSet;

  const EmailInputWidget({
    required this.colorSet,
    super.key,
  });

  @override
  State<EmailInputWidget> createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose(); // Controller 메모리 해제
    super.dispose();
  }

  void _submitEmail() {
    String email = emailController.text.trim(); // 공백 제거
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '이메일을 입력해주세요.',
            style: TextStyle(color: widget.colorSet['textPrimary']),
          ),
          backgroundColor: widget.colorSet['accent'],
        ),
      );
    } else {
      // 이메일 제출 처리
      print('이메일 제출: $email');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '이메일이 제출되었습니다.(//백엔드 개발 중)',
            style: TextStyle(color: widget.colorSet['textPrimary']),
          ),
          backgroundColor: widget.colorSet['primary'],
        ),
      );
      emailController.clear(); // 제출 후 입력 필드 초기화
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '뉴스레터를 받으시려면 이메일 주소를 입력해주세요:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: widget.colorSet['textPrimary'],
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'example@domain.com',
              hintStyle: TextStyle(color: widget.colorSet['textSecondary']),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: widget.colorSet['background']?.withOpacity(0.7),
            ),
            style: TextStyle(color: widget.colorSet['textPrimary']),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: _submitEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.colorSet['primary'],
                foregroundColor: widget.colorSet['textPrimary'],
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 5,
              ),
              child: const Text(
                '이메일 제출',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
