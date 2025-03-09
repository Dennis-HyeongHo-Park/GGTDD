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
    '할일 관리 앱,\n꾸준히 사용하고 계신가요?\n아니면 ...\n또 잊혀진 채 방치되고 있나요?',
  ];

  final List<String> _images = [
    'assets/images/Ellipse_43.png',
    'assets/images/Ellipse_44.png',
    'assets/images/Ellipse_45.png',
    'assets/images/to-do-list.png',
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _changeContents() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _texts.length;
    });
  }

  Widget _buildLastScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Image.asset(
            'assets/images/ggtdd.png',
            width: 150,
            height: 75,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
              children: [
                const TextSpan(text: '할일 관리 앱,\n'),
                const TextSpan(
                  text: '꾸준히 사용하고 계신가요?\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: '아니면 ...\n'),
                TextSpan(
                  text: '또 잊혀진 채 방치되고 있나요?',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Center(
          child: Image.asset(
            'assets/images/to-do-list.png',
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeContents,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: _currentIndex == 3
              ? _buildLastScreen()
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
