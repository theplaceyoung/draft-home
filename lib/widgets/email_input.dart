import 'package:flutter/material.dart';

class EmailInputWidget extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final Map<String, Color> colorSet;

  EmailInputWidget({
    required this.colorSet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽정렬
        children: [
          Text(
            '뉴스레터를 받으시려면 이메일 주소를 입력해주세요:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: colorSet['textPrimary'],
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'example@domain.com',
              hintStyle: TextStyle(color: colorSet['textSecondary']),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              filled: true,
              fillColor: Colors.black.withOpacity(0.7),
            ),
            style: TextStyle(color: colorSet['textPrimary']),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              String email = emailController.text;
              if (email.isNotEmpty) {
                // 이메일 주소 제출 처리
                print('이메일 제출: $email');
              } else {
                // 이메일을 입력하지 않은 경우
                print('이메일을 입력해주세요.');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorSet['primary'], // secondary 색상
              foregroundColor: colorSet['accent'], // 텍스트 색상 (accent)
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 5,
            ),
            child: Text(
              '이메일 제출',
              style: TextStyle(
                fontSize: 18, // 텍스트 크기
                fontWeight: FontWeight.bold, // 텍스트 두께
              ),
            ),
          ),
        ],
      ),
    );
  }
}
