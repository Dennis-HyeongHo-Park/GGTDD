import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String logoImagePath;

  const HomeScreen({
    super.key,
    required this.logoImagePath,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _texts = [
    'AI로 완벽한 GTD 경험',
    '쏟아지는 업무를\n스트레스 없이\n관리하세요.',
    '개인 맞춤형 AI가\n당신의 할 일을\n최적화합니다.',
  ];

  final List<String> _images = [
    'assets/images/Ellipse_43.png',
    'assets/images/Ellipse_44.png',
    'assets/images/Ellipse_45.png',
  ];

  int _currentIndex = 0;

  void _changeContents() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _texts.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeContents,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 로고 영역
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    widget.logoImagePath,
                    width: 300,
                    height: 150,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('이미지를 불러올 수 없습니다');
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // 텍스트 영역
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Center(
                    child: Text(
                      _texts[_currentIndex],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // 이미지 영역 - 텍스트 인덱스에 맞춰 변경
                Image.asset(
                  _images[_currentIndex],
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text('이미지를 불러올 수 없습니다');
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
