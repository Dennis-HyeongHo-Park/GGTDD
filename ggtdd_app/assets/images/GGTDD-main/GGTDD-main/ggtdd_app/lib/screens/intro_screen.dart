import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({
    super.key,
  });

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<String> _texts = [
    'AI로 완벽한 GTD 경험',
    '쏟아지는 업무를\n스트레스 없이\n관리하세요.',
    '개인 맞춤형 AI가\n당신의 할 일을\n최적화합니다.',
    '할일 관리 앱,\n\n꾸준히 사용하고 계신가요?\n\n아니면 ...\n\n또 잊혀진 채 방치되고 있나요?',
    "문제는 단순해요.\n\n'운동하기', '공부하기' 같은 막연한 할 일들...\n\n시작할 동기를 잃게되죠.",
    "하지만 이렇게 바꿔보세요 :\n\n'오후 7시, 공원에서 30분간 가볍게 뛰기'\n\n갑자기 할 수 있을 것 같지 않나요?",
    "GGTDD는 그걸 대신해줍니다.\n\n'공부하기'를 이렇게 :\n\n1. 교재 10쪽 읽기,\n\n2. 노트 정리하기,\n\n3. 퀴즈 풀기,\n\n로 바꿔요.",
    '먼저, 머릿속을 비워요.\n\n떠오르는 모든 할 일, 아이디어, 걱정...\n\n전부 모아 놓습니다.',
    '그 다음, AI가 정리해줍니다.\n\n복잡한 할 일이 명확한 단계로 바뀌고,\n\n무엇부터 할지 알려줘요.',
    '이 과정을 반복해보세요.\n\n할 일은 줄어들고, 머릿속은 맑아지고,\n\n미뤄왔던 일들이 하나씩 끝나갑니다.',
    '이제, 저희와 함께 시작해볼까요?\n\n당신의 할 일, 당신의 삶을\n\n바꿀 준비가 되셨나요?',
  ];

  final List<String> _images = [
    'assets/images/Ellipse_43.jpg',
    'assets/images/Ellipse_45.png',
    'assets/images/Ellipse_44.png',
    'assets/images/to-do-list.png',
    'assets/images/man.png',
    'assets/images/details_1.png',
    'assets/images/critical-thinking_1.png',
    'assets/images/inbox_1.png',
    'assets/images/communication-skills_1.png',
    'assets/images/loop_1.png',
    'assets/images/improve_1.png',
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
      if (_currentIndex < _texts.length - 1) {
        _currentIndex = _currentIndex + 1;
      }
    });
  }

  Widget _buildLastScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 10),
          child: Text(
            'GGTDD',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
              children: [
                const TextSpan(text: '할일 관리 앱,\n\n'),
                const TextSpan(
                  text: '꾸준히 사용하고 계신가요?\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: '아니면 ...\n\n'),
                TextSpan(
                  text: '또 잊혀진 채 방치되고 있나요?',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 100),
        Center(
          child: Image.asset(
            _images[_currentIndex],
            width: 400,
            height: 400,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              print('Image load error: $error');
              print('Image path: ${_images[_currentIndex]}');
              print('Stack trace: $stackTrace');
              return Column(
                children: [
                  const Text('이미지를 불러올 수 없습니다'),
                  Text('Error: $error'),
                  Text('Path: ${_images[_currentIndex]}'),
                ],
              );
            },
          ),
        ),
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
              : _currentIndex > 3
                  ? _buildAdditionalScreen()
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, top: 10),
                            child: Image.asset(
                              'assets/images/ggtdd.png',
                              width: 400,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Text(
                            _texts[_currentIndex],
                            style: TextStyle(
                              fontSize: _currentIndex < 3 ? 40 : 24,
                              fontWeight: _currentIndex < 3
                                  ? FontWeight.w900
                                  : FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Expanded(
                            child: Center(
                              child: Image.asset(
                                _images[_currentIndex],
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  print('Image load error: $error');
                                  print(
                                      'Image path: ${_images[_currentIndex]}');
                                  print('Stack trace: $stackTrace');
                                  return Column(
                                    children: [
                                      const Text('이미지를 불러올 수 없습니다'),
                                      Text('Error: $error'),
                                      Text('Path: ${_images[_currentIndex]}'),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }

  Widget _buildAdditionalScreen() {
    if (_currentIndex == 4) {
      return _buildTextScreen(
        [
          TextSpan(
            text: '문제는 ',
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
          TextSpan(
            text: '단순해요.\n\n',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "'운동하기', '공부하기'",
            style: const TextStyle(fontSize: 24, color: Colors.grey),
          ),
          TextSpan(
            text: ' 같은 막연한 할 일들...\n\n시작할 동기를 잃게되죠.',
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
        ],
      );
    } else if (_currentIndex == 5) {
      return _buildTextScreen(
        [
          TextSpan(
            text: "하지만 이렇게 바꿔보세요 :\n\n",
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
          TextSpan(
            text: "'오후 7시, 공원에서 30분간 가볍게 뛰기'\n\n",
            style: const TextStyle(fontSize: 24, color: Colors.red),
          ),
          TextSpan(
            text: "갑자기 할 수 있을 것 같지 않나요?",
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
        ],
      );
    } else if (_currentIndex == 6) {
      return _buildTextScreen(
        [
          TextSpan(
            text: "GGTDD는 그걸 대신해줍니다.\n\n",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "'공부하기'",
            style: const TextStyle(fontSize: 24, color: Colors.grey),
          ),
          TextSpan(
            text: "를 이렇게 :\n\n",
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
          TextSpan(
            text: "1. 교재 10쪽 읽기,\n\n2. 노트 정리하기,\n\n3. 퀴즈 풀기,\n\n",
            style: const TextStyle(fontSize: 24, color: Colors.red),
          ),
          TextSpan(
            text: "로 바꿔요.",
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
        ],
      );
    } else if (_currentIndex == 7) {
      return _buildTextScreen(
        [
          TextSpan(
            text: "먼저, 머릿속을 비워요.\n\n",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "떠오르는 모든 할 일, 아이디어, 걱정...\n\n",
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          TextSpan(
            text: "전부 모아 놓습니다.",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      );
    } else if (_currentIndex == 8) {
      return _buildTextScreen(
        [
          TextSpan(
            text: "그 다음, AI가 정리해줍니다.\n\n",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "복잡한 할 일",
            style: const TextStyle(fontSize: 24, color: Colors.grey),
          ),
          TextSpan(
            text: "이 ",
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
          TextSpan(
            text: "명확한 단계",
            style: const TextStyle(fontSize: 24, color: Colors.red),
          ),
          TextSpan(
            text: "로 바뀌고,\n\n무엇부터 할지 알려줘요.",
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
        ],
      );
    } else if (_currentIndex == 9) {
      return _buildTextScreen(
        [
          TextSpan(
            text: "이 과정을 반복해보세요.\n\n",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "할 일은 줄어들고, 머릿속은 맑아지고,\n\n미뤄왔던 일들이 하나씩 끝나갑니다.",
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
        ],
      );
    } else if (_currentIndex == 10) {
      return _buildTextScreen(
        [
          TextSpan(
            text: "이제, 저희와 함께 시작해볼까요?\n\n",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "당신의 할 일, 당신의 삶을\n\n",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "바꿀 준비",
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          TextSpan(
            text: "가 되셨나요?",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      );
    }
    return _buildTextScreen([
      TextSpan(
        text: _texts[_currentIndex],
        style: const TextStyle(fontSize: 24, color: Colors.black),
      ),
    ]);
  }

  Widget _buildTextScreen(List<TextSpan> textSpans) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 10),
          child: Image.asset(
            'assets/images/ggtdd.png',
            width: 115,
            height: 55,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
            text: TextSpan(
              children: textSpans,
            ),
          ),
        ),
        const SizedBox(height: 100),
        Center(
          child: Image.asset(
            _images[_currentIndex],
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
        ),
        if (_currentIndex == 10) ...[
          const SizedBox(height: 80),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/start_info');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 180, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                '시작하기',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
