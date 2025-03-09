import 'package:flutter/material.dart';

class ContextOptionScreen extends StatelessWidget {
  const ContextOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 이전 화면에서 전달받은 사용자 정보
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String name = args?['name'] as String? ?? '사용자';
    final String occupation = args?['occupation'] as String? ?? '회사원';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 로고
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 10),
                child: Image.asset(
                  'assets/images/ggtdd.png',
                  width: 115,
                  height: 55,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 115,
                      height: 55,
                      alignment: Alignment.center,
                      child: const Text(
                        'GGTDD',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 60),

              // 메인 타이틀
              Center(
                child: Text(
                  '$name님,\n하루를 위한\n9가지 맥락을 만나보세요.',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),

              // 설명 텍스트
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '안녕하세요, $name님!\nGGTDD가 $occupation 직업에 맞춰 하루를 정리할\n9가지 기본 맥락을 준비했어요.\n이 맥락들은 시작점일 뿐,\n나중에 [설정 페이지]에서 당신의 삶에 맞게 바꿀 수 있어요!',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),

              // 구분선
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              const SizedBox(height: 20),

              // 기상 및 준비 섹션
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '기상 및 준비',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 50, // 버튼의 높이 고정
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics:
                            const BouncingScrollPhysics(), // iOS 스타일의 바운스 효과
                        children: [
                          _buildContextButton(
                            icon: Icons.calendar_today,
                            label: '평일',
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10),
                          _buildContextButton(
                            icon: Icons.access_time,
                            label: '아침',
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10),
                          _buildContextButton(
                            icon: Icons.home,
                            label: '집',
                            onPressed: () {},
                          ),
                          const SizedBox(width: 20), // 마지막 여백 추가
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContextButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.black54,
          ),
          if (label.isNotEmpty) ...[
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
