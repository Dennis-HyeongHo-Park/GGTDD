import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InsertInfoScreen extends StatefulWidget {
  const InsertInfoScreen({super.key});

  @override
  State<InsertInfoScreen> createState() => _InsertInfoScreenState();
}

class _InsertInfoScreenState extends State<InsertInfoScreen> {
  String? _name;
  String? _location;
  String? _birthday;
  String? _occupation;
  String? _mbti;
  final TextEditingController _nameController = TextEditingController();
  int? _selectedYear;
  int? _selectedMonth;
  int? _selectedDay;

  // MBTI 모름 팝업창에서 사용할 상태 변수들
  String? _selectedE;
  String? _selectedS;
  String? _selectedT;
  String? _selectedJ;

  final List<int> _years = List.generate(
      DateTime.now().year - 1920 + 1, (index) => DateTime.now().year - index);
  final List<int> _months = List.generate(12, (index) => index + 1);
  final List<int> _days = List.generate(31, (index) => index + 1);

  final List<String> _occupations = [
    '회사원',
    '사업자',
    '공무원',
    '기타(프리랜서, 아르바이트 등)',
    '무직(주부 등)',
    '취업 준비생',
    '학생'
  ];

  final List<String> _mbtiTypes = [
    'ISTJ',
    'ISTP',
    'ESTP',
    'ESTJ',
    'ISFJ',
    'ISFP',
    'ESFP',
    'ESFJ',
    'INFJ',
    'INFP',
    'ENFP',
    'ENFJ',
    'INTJ',
    'INTP',
    'ENTP',
    'ENTJ'
  ];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _showNameDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (context) => AlertDialog(
        title: const Text(
          '이름',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: '이름을 입력해 주세요',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _name = _nameController.text;
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                '입력하기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLocationDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (context) => AlertDialog(
        title: const Text(
          '지역 선택',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SizedBox(
          width: 300,
          height: 300,
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: ['서울', '경기', '강원', '충청', '전라', '경상', '부산', '제주', '해외']
                .map((location) => ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _location = location;
                        });
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        location,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  void _showBirthdayDialog() {
    int tempYear = _years[0];
    int tempMonth = _months[0];
    int tempDay = _days[0];

    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text(
            '생년월일',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            height: 250,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          SizedBox(
                            width: 80,
                            height: 150,
                            child: CupertinoPicker(
                              itemExtent: 44,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  tempYear = _years[index];
                                });
                              },
                              selectionOverlay: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.grey[300]!, width: 1),
                                    bottom: BorderSide(
                                        color: Colors.grey[300]!, width: 1),
                                  ),
                                ),
                              ),
                              children: _years
                                  .map((year) => Center(
                                        child: Text(
                                          year.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          const Positioned(
                            right: 5,
                            child: Text(
                              '년',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 150,
                            child: CupertinoPicker(
                              itemExtent: 44,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  tempMonth = _months[index];
                                });
                              },
                              selectionOverlay: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.grey[300]!, width: 1),
                                    bottom: BorderSide(
                                        color: Colors.grey[300]!, width: 1),
                                  ),
                                ),
                              ),
                              children: _months
                                  .map((month) => Center(
                                        child: Text(
                                          month.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          const Positioned(
                            right: 5,
                            child: Text(
                              '월',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 150,
                            child: CupertinoPicker(
                              itemExtent: 44,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  tempDay = _days[index];
                                });
                              },
                              selectionOverlay: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.grey[300]!, width: 1),
                                    bottom: BorderSide(
                                        color: Colors.grey[300]!, width: 1),
                                  ),
                                ),
                              ),
                              children: _days
                                  .map((day) => Center(
                                        child: Text(
                                          day.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          const Positioned(
                            right: 5,
                            child: Text(
                              '일',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    this.setState(() {
                      _selectedYear = tempYear;
                      _selectedMonth = tempMonth;
                      _selectedDay = tempDay;
                      _birthday =
                          '$_selectedYear년 $_selectedMonth월 $_selectedDay일';
                    });
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    '입력하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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

  void _showOccupationDialog() {
    String tempOccupation = _occupations[0];

    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text(
            '직업',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            height: 250,
            child: Column(
              children: [
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 44,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        tempOccupation = _occupations[index];
                      });
                    },
                    selectionOverlay: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey[300]!, width: 1),
                          bottom:
                              BorderSide(color: Colors.grey[300]!, width: 1),
                        ),
                      ),
                    ),
                    children: _occupations
                        .map((occupation) => Center(
                              child: Text(
                                occupation,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    this.setState(() {
                      _occupation = tempOccupation;
                    });
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    '입력하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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

  void _showMBTIDialog() {
    String? tempMbti;

    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text(
            'MBTI',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: 400,
            height: 520,
            child: Column(
              children: [
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.0,
                    padding: const EdgeInsets.all(16),
                    children: _mbtiTypes
                        .map((type) => ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  tempMbti = tempMbti == type ? null : type;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: tempMbti == type
                                    ? Colors.blue
                                    : Colors.grey[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(0),
                              ),
                              child: Text(
                                type,
                                style: TextStyle(
                                  color: tempMbti == type
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 160,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _showMBTIDetailDialog();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE3F2FD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'MBTI 모름',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: tempMbti == null
                            ? null
                            : () {
                                this.setState(() {
                                  _mbti = tempMbti;
                                });
                                Navigator.pop(context);
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tempMbti == null
                              ? Colors.grey[300]
                              : Color(0xFFE3F2FD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          '입력하기',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMBTIDetailDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text(
            '생활 스타일',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: 355,
            height: 450,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '에너지 충전 방식',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () => setState(() =>
                                _selectedE = _selectedE == 'E' ? null : 'E'),
                            onLongPress: () => _showDescriptionDialog(
                                context, _getButtonDescription('E')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _selectedE == 'E'
                                  ? Colors.blue
                                  : Colors.grey[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            child: Text(
                              'E : 외향적',
                              style: TextStyle(
                                color: _selectedE == 'E'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => setState(() =>
                                _selectedE = _selectedE == 'I' ? null : 'I'),
                            onLongPress: () => _showDescriptionDialog(
                                context, _getButtonDescription('I')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _selectedE == 'I'
                                  ? Colors.blue
                                  : Colors.grey[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            child: Text(
                              'I : 내향적',
                              style: TextStyle(
                                color: _selectedE == 'I'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '정보 처리 방식',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () => setState(() =>
                                _selectedS = _selectedS == 'S' ? null : 'S'),
                            onLongPress: () => _showDescriptionDialog(
                                context, _getButtonDescription('S')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _selectedS == 'S'
                                  ? Colors.blue
                                  : Colors.grey[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            child: Text(
                              'S : 감각적',
                              style: TextStyle(
                                color: _selectedS == 'S'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => setState(() =>
                                _selectedS = _selectedS == 'N' ? null : 'N'),
                            onLongPress: () => _showDescriptionDialog(
                                context, _getButtonDescription('N')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _selectedS == 'N'
                                  ? Colors.blue
                                  : Colors.grey[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            child: Text(
                              'N : 직관적',
                              style: TextStyle(
                                color: _selectedS == 'N'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '의사 결정 방식',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () => setState(() =>
                                _selectedT = _selectedT == 'T' ? null : 'T'),
                            onLongPress: () => _showDescriptionDialog(
                                context, _getButtonDescription('T')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _selectedT == 'T'
                                  ? Colors.blue
                                  : Colors.grey[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            child: Text(
                              'T : 사고형',
                              style: TextStyle(
                                color: _selectedT == 'T'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => setState(() =>
                                _selectedT = _selectedT == 'F' ? null : 'F'),
                            onLongPress: () => _showDescriptionDialog(
                                context, _getButtonDescription('F')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _selectedT == 'F'
                                  ? Colors.blue
                                  : Colors.grey[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            child: Text(
                              'F : 감정형',
                              style: TextStyle(
                                color: _selectedT == 'F'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '생활 조직 방식',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () => setState(() =>
                                _selectedJ = _selectedJ == 'J' ? null : 'J'),
                            onLongPress: () => _showDescriptionDialog(
                                context, _getButtonDescription('J')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _selectedJ == 'J'
                                  ? Colors.blue
                                  : Colors.grey[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            child: Text(
                              'J : 판단형',
                              style: TextStyle(
                                color: _selectedJ == 'J'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => setState(() =>
                                _selectedJ = _selectedJ == 'P' ? null : 'P'),
                            onLongPress: () => _showDescriptionDialog(
                                context, _getButtonDescription('P')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _selectedJ == 'P'
                                  ? Colors.blue
                                  : Colors.grey[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            child: Text(
                              'P : 인식형',
                              style: TextStyle(
                                color: _selectedJ == 'P'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  '각 버튼 1초 정도 누르고 있으면 간단한 설명을 보실 수 있습니다.',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '해당 방식은 간단하게 생활 스타일을 고려해서 MBTI를 간략하게 유추해보는 것이기 때문에 더 정확한 결과를 위해 추가적인 MBTI 검사를 받아보세요!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_selectedE != null &&
                          _selectedS != null &&
                          _selectedT != null &&
                          _selectedJ != null) {
                        this.setState(() {
                          _mbti = _selectedE! +
                              _selectedS! +
                              _selectedT! +
                              _selectedJ!;
                        });
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      '입력하기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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

  void _showDescriptionDialog(BuildContext context, String description) {
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100,
        left: (MediaQuery.of(context).size.width - 355) / 2,
        child: Material(
          color: Colors.transparent,
          child: StatefulBuilder(
            builder: (context, setState) {
              return TweenAnimationBuilder(
                duration: const Duration(milliseconds: 300),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: child,
                  );
                },
                child: Container(
                  width: 355,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '설명',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(seconds: 4), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
        overlayEntry = OverlayEntry(
          builder: (context) => Positioned(
            top: 100,
            left: (MediaQuery.of(context).size.width - 355) / 2,
            child: Material(
              color: Colors.transparent,
              child: TweenAnimationBuilder(
                duration: const Duration(milliseconds: 300),
                tween: Tween<double>(begin: 1, end: 0),
                onEnd: () {
                  overlayEntry.remove();
                },
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: child,
                  );
                },
                child: Container(
                  width: 355,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '설명',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        Overlay.of(context).insert(overlayEntry);
      }
    });
  }

  String _getButtonDescription(String type) {
    switch (type) {
      case 'E':
        return '사람들과 어울리며 활력을 얻어요.';
      case 'I':
        return '혼자만의 시간을 통해 에너지를 채워요.';
      case 'S':
        return '구체적인 사실과 현실에 집중해요.';
      case 'N':
        return '미래의 가능성과 아이디어에 끌려요.';
      case 'T':
        return '논리와 객관적인 분석을 우선해요.';
      case 'F':
        return '감정과 타인의 가치를 고려해요.';
      case 'J':
        return '계획적이고 구조적인 삶을 선호해요.';
      case 'P':
        return '유연하고 즉흥적인 삶을 즐겨요.';
      default:
        return '';
    }
  }

  String _getHeaderText() {
    if (_name == null) {
      return '당신의 이름은 무엇인가요?';
    } else if (_location == null) {
      return '$_name님,\n당신의 거주지는 어디인가요?';
    } else if (_birthday == null) {
      return '$_name님,\n당신의 생일은 언제인가요?';
    } else if (_occupation == null) {
      return '$_name님,\n당신의 직업은 무엇인가요?';
    } else {
      return '$_name님,\n당신의 MBTI는 무엇인가요?';
    }
  }

  @override
  Widget build(BuildContext context) {
    bool allFieldsFilled = _name != null &&
        _location != null &&
        _birthday != null &&
        _occupation != null &&
        _mbti != null;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 0, top: 10),
                child: Image.asset(
                  'assets/images/ggtdd.png',
                  width: 115,
                  height: 55,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: Text(
                _getHeaderText(),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_occupation != null) ...[
                    const Text(
                      'MBTI',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: _showMBTIDialog,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (_mbti == null)
                                    const Text(
                                      'MBTI를 선택해 주세요',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    )
                                  else
                                    const SizedBox(),
                                  if (_mbti != null)
                                    Text(
                                      _mbti!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                  if (_birthday != null) ...[
                    const Text(
                      '직업',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: _showOccupationDialog,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (_occupation == null)
                                    const Text(
                                      '직업을 선택해 주세요',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    )
                                  else
                                    const SizedBox(),
                                  if (_occupation != null)
                                    Text(
                                      _occupation!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                  if (_location != null) ...[
                    const Text(
                      '생년월일',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: _showBirthdayDialog,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (_birthday == null)
                                    const Text(
                                      '생년월일을 선택해 주세요',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    )
                                  else
                                    const SizedBox(),
                                  if (_birthday != null)
                                    Text(
                                      _birthday!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                  if (_name != null) ...[
                    const Text(
                      '거주지',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: _showLocationDialog,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (_location == null)
                                    const Text(
                                      '거주지를 선택해 주세요',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    )
                                  else
                                    const SizedBox(),
                                  if (_location != null)
                                    Text(
                                      _location!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                  const Text(
                    '이름',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: _showNameDialog,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (_name == null)
                                  const Text(
                                    '이름을 입력해 주세요',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  )
                                else
                                  const SizedBox(),
                                if (_name != null)
                                  Text(
                                    _name!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (allFieldsFilled)
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/context_option',
                        arguments: {
                          'name': _name,
                          'occupation': _occupation,
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      '다음',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
