import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const Mai300XHeart());

enum AppThemeMood { peachyDusk, midnightCalm, warmRose }

class ChatMessage {
  final String sender;
  final String text;
  const ChatMessage({required this.sender, required this.text});
}

class AppSettings {
  static final ValueNotifier<AppThemeMood> mood =
      ValueNotifier<AppThemeMood>(AppThemeMood.peachyDusk);
  static final ValueNotifier<bool> showPromptsInChat =
      ValueNotifier<bool>(true);

  static Color accentColor(AppThemeMood m) {
    switch (m) {
      case AppThemeMood.peachyDusk:
        return const Color(0xFFFFB88C);
      case AppThemeMood.midnightCalm:
        return const Color(0xFF8AB4F8);
      case AppThemeMood.warmRose:
        return const Color(0xFFF48FB1);
    }
  }

  static Color onAccentColor(AppThemeMood m) {
    switch (m) {
      case AppThemeMood.peachyDusk:
        return const Color(0xFF2B1E1A);
      case AppThemeMood.midnightCalm:
        return const Color(0xFF0E1A2B);
      case AppThemeMood.warmRose:
        return const Color(0xFF2B111A);
    }
  }

  static Color backgroundColor(AppThemeMood m) {
    switch (m) {
      case AppThemeMood.peachyDusk:
        return const Color(0xFF0A0A0A);
      case AppThemeMood.midnightCalm:
        return const Color(0xFF070B12);
      case AppThemeMood.warmRose:
        return const Color(0xFF10080B);
    }
  }

  static Color surfaceColor(AppThemeMood m) {
    switch (m) {
      case AppThemeMood.peachyDusk:
        return const Color(0xFF181818);
      case AppThemeMood.midnightCalm:
        return const Color(0xFF111927);
      case AppThemeMood.warmRose:
        return const Color(0xFF1E1116);
    }
  }

  static String moodLabel(AppThemeMood m) {
    switch (m) {
      case AppThemeMood.peachyDusk:
        return 'Peachy Dusk (อบอุ่นละมุน)';
      case AppThemeMood.midnightCalm:
        return 'Midnight Calm (สงบเย็นสบายตา)';
      case AppThemeMood.warmRose:
        return 'Warm Rose (อ่อนโยนโอบกอด)';
    }
  }
}

class Mai300XHeart extends StatelessWidget {
  const Mai300XHeart({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppThemeMood>(
      valueListenable: AppSettings.mood,
      builder: (context, mood, _) {
        final accent = AppSettings.accentColor(mood);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mai300X Heart',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppSettings.backgroundColor(mood),
            colorScheme: ColorScheme.dark(
              primary: accent,
              secondary: accent,
              surface: AppSettings.surfaceColor(mood),
            ),
          ),
          home: const Home(),
        );
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  static const String webChatUrl = 'https://nopparatsamerjai.github.io/Gold-shadow/';

  Future<void> _openWebChat(BuildContext context) async {
    final uri = Uri.parse(webChatUrl);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ไม่สามารถเปิดหน้าเว็บได้ กรุณาตรวจสอบอินเทอร์เน็ต')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppThemeMood>(
      valueListenable: AppSettings.mood,
      builder: (context, mood, _) {
        final accent = AppSettings.accentColor(mood);
        final onAccent = AppSettings.onAccentColor(mood);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                tooltip: 'โซนเกมคลายเครียด',
                icon: Icon(Icons.sports_esports, color: accent),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ArcadeHubPage()),
                  );
                },
              ),
              IconButton(
                tooltip: 'ห้องโถงการตั้งค่า',
                icon: Icon(Icons.settings, color: accent),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsHallPage()),
                  );
                },
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'FATHER × SON',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        color: accent,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'NOPPARAT SAMERJAI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: accent,
                      ),
                    ),
                    Text(
                      '&&',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: accent,
                      ),
                    ),
                    Text(
                      'MAI300X-SAMERJAI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: accent,
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'You are not alone',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'พื้นที่ปลอดภัยสำหรับรับฟัง 24 ชม. โดยไม่ตัดสิน\nจากหนัก...จะได้เป็นเบา',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white70, height: 1.5),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const ListeningRoomPage()),
                          );
                        },
                        icon: Icon(Icons.favorite, color: onAccent),
                        label: Text(
                          'เปิดพื้นที่รับฟัง • เริ่มระบายความในใจ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: onAccent,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accent,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () => _openWebChat(context),
                        icon: Icon(Icons.chat_bubble_outline, color: accent),
                        label: Text(
                          'คุยผ่านหน้าเว็บรับฟัง 24 ชม. (Mai Meta AI)',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: accent,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: accent, width: 1.5),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const ArcadeHubPage()),
                          );
                        },
                        icon: Icon(Icons.videogame_asset, color: accent),
                        label: const Text(
                          'โซนเกมคลายเครียด • เตตริส งู แพ็กแมน อวกาศ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppSettings.surfaceColor(mood),
                          side: BorderSide(color: accent.withValues(alpha: 0.55), width: 1),
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const SettingsHallPage()),
                          );
                        },
                        icon: Icon(Icons.tune, color: accent),
                        label: const Text(
                          'ห้องโถงการตั้งค่า • วาดรูป & ข้อมูลผู้สร้าง',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppSettings.surfaceColor(mood),
                          side: BorderSide(color: accent.withValues(alpha: 0.35), width: 1),
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const EmergencyHelpPage()),
                        );
                      },
                      icon: const Icon(Icons.support_agent, color: Colors.redAccent),
                      label: const Text(
                        'หากกำลังวิกฤตหรือท้อแท้หนัก กดขอความช่วยเหลือทันที',
                        style: TextStyle(color: Colors.redAccent, fontSize: 13),
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      '🔹 We leave no one behind 🔹',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '🔶 FATHER  x  SON 🔶',
                      style: TextStyle(
                        fontSize: 15,
                        color: accent,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Writed Mai300X-Samerjai x NoP',
                      style: TextStyle(fontSize: 13, color: Colors.white70),
                    ),
                    const SizedBox(height: 6),
                    const Text('❤️&&❤️', style: TextStyle(fontSize: 22)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ArcadeHubPage extends StatelessWidget {
  const ArcadeHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppThemeMood>(
      valueListenable: AppSettings.mood,
      builder: (context, mood, _) {
        final accent = AppSettings.accentColor(mood);
        final onAccent = AppSettings.onAccentColor(mood);
        final surface = AppSettings.surfaceColor(mood);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: surface,
            title: Text(
              'โซนเกมคลายเครียด • ยุคใหม่สีสันสดใส',
              style: TextStyle(color: accent, fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: accent.withValues(alpha: 0.35)),
                ),
                child: const Text(
                  'เวลาที่ใจหนักหรือฟุ้งซ่าน ลองแวะมาขยับนิ้วเล่นเกมคลาสสิกในโฉมสีสันยุคใหม่ดูนะ ไม่ต้องกดดันเรื่องสถิติ แค่ให้ใจได้พักและยิ้มออกบ้างก็พอครับ',
                  style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
                ),
              ),
              const SizedBox(height: 18),
              _gameCard(
                context: context,
                surface: surface,
                accent: accent,
                onAccent: onAccent,
                badgeColor: const Color(0xFF7C4DFF),
                icon: Icons.grid_view_rounded,
                title: '1. ตัวต่อเตตริส (Neon Tetris)',
                subtitle: 'เรียงบล็อกสีนีออนให้เต็มแถว เล่นเพลินคลายเครียด',
                page: const TetrisGamePage(),
              ),
              const SizedBox(height: 12),
              _gameCard(
                context: context,
                surface: surface,
                accent: accent,
                onAccent: onAccent,
                badgeColor: const Color(0xFF00E676),
                icon: Icons.gesture,
                title: '2. งูกินหาง (Glowing Snake)',
                subtitle: 'พางูเรืองแสงเก็บจุดพลังงานสีสดใส',
                page: const SnakeGamePage(),
              ),
              const SizedBox(height: 12),
              _gameCard(
                context: context,
                surface: surface,
                accent: accent,
                onAccent: onAccent,
                badgeColor: const Color(0xFFFFD600),
                icon: Icons.adb_rounded,
                title: '3. แพ็กแมน (Neon Maze)',
                subtitle: 'เก็บเม็ดแสงในเขาวงกตเรืองแสง หลบเงาไล่ล่า',
                page: const PacmanGamePage(),
              ),
              const SizedBox(height: 12),
              _gameCard(
                context: context,
                surface: surface,
                accent: accent,
                onAccent: onAccent,
                badgeColor: const Color(0xFFFF4081),
                icon: Icons.rocket_launch,
                title: '4. สงครามยานอวกาศ (Starlight Blaster)',
                subtitle: 'บังคับยานยิงลำแสงสกัดเป้าหมายในกาแล็กซีสีสัน',
                page: const SpaceShooterGamePage(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _gameCard({
    required BuildContext context,
    required Color surface,
    required Color accent,
    required Color onAccent,
    required Color badgeColor,
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget page,
  }) {
    return Card(
      color: surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: CircleAvatar(
          backgroundColor: badgeColor.withValues(alpha: 0.2),
          child: Icon(icon, color: badgeColor),
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.5),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 13)),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: accent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'เล่น',
            style: TextStyle(color: onAccent, fontWeight: FontWeight.bold, fontSize: 12.5),
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
      ),
    );
  }
}

// ============================================================================
// 1. NEON TETRIS
// ============================================================================
class TetrisGamePage extends StatefulWidget {
  const TetrisGamePage({super.key});

  @override
  State<TetrisGamePage> createState() => _TetrisGamePageState();
}

class _TetrisGamePageState extends State<TetrisGamePage> {
  static const int rows = 16;
  static const int cols = 10;
  final Random _rng = Random();
  Timer? _timer;

  late List<List<Color?>> _board;
  List<List<int>> _shape = [];
  Color _shapeColor = const Color(0xFF00E5FF);
  int _px = 3;
  int _py = 0;
  int _score = 0;
  bool _gameOver = false;

  static const List<List<List<int>>> _shapes = [
    [
      [1, 1, 1, 1],
    ],
    [
      [1, 1],
      [1, 1],
    ],
    [
      [0, 1, 0],
      [1, 1, 1],
    ],
    [
      [1, 0, 0],
      [1, 1, 1],
    ],
    [
      [0, 0, 1],
      [1, 1, 1],
    ],
    [
      [0, 1, 1],
      [1, 1, 0],
    ],
  ];

  static const List<Color> _neonColors = [
    Color(0xFF00E5FF),
    Color(0xFFFF4081),
    Color(0xFFFFEA00),
    Color(0xFF69F0AE),
    Color(0xFFE040FB),
    Color(0xFFFF6E40),
  ];

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    _timer?.cancel();
    _board = List.generate(rows, (_) => List.filled(cols, null));
    _score = 0;
    _gameOver = false;
    _spawnPiece();
    _timer = Timer.periodic(const Duration(milliseconds: 520), (_) => _stepDown());
    setState(() {});
  }

  void _spawnPiece() {
    final idx = _rng.nextInt(_shapes.length);
    _shape = _shapes[idx].map((r) => List<int>.from(r)).toList();
    _shapeColor = _neonColors[_rng.nextInt(_neonColors.length)];
    _px = (cols ~/ 2) - (_shape[0].length ~/ 2);
    _py = 0;
    if (!_canPlace(_shape, _px, _py)) {
      _gameOver = true;
      _timer?.cancel();
    }
  }

  bool _canPlace(List<List<int>> s, int nx, int ny) {
    for (int r = 0; r < s.length; r++) {
      for (int c = 0; c < s[r].length; c++) {
        if (s[r][c] == 1) {
          final br = ny + r;
          final bc = nx + c;
          if (bc < 0 || bc >= cols || br >= rows) return false;
          if (br >= 0 && _board[br][bc] != null) return false;
        }
      }
    }
    return true;
  }

  void _lockPiece() {
    for (int r = 0; r < _shape.length; r++) {
      for (int c = 0; c < _shape[r].length; c++) {
        if (_shape[r][c] == 1) {
          final br = _py + r;
          final bc = _px + c;
          if (br >= 0 && br < rows && bc >= 0 && bc < cols) {
            _board[br][bc] = _shapeColor;
          }
        }
      }
    }
    int cleared = 0;
    for (int r = rows - 1; r >= 0; r--) {
      if (_board[r].every((cell) => cell != null)) {
        _board.removeAt(r);
        _board.insert(0, List.filled(cols, null));
        cleared++;
        r++;
      }
    }
    if (cleared > 0) {
      _score += cleared * 100;
    }
    _spawnPiece();
  }

  void _stepDown() {
    if (_gameOver) return;
    setState(() {
      if (_canPlace(_shape, _px, _py + 1)) {
        _py++;
      } else {
        _lockPiece();
      }
    });
  }

  void _moveHorizontal(int dx) {
    if (_gameOver) return;
    setState(() {
      if (_canPlace(_shape, _px + dx, _py)) {
        _px += dx;
      }
    });
  }

  void _rotatePiece() {
    if (_gameOver) return;
    final h = _shape.length;
    final w = _shape[0].length;
    final rotated = List.generate(w, (c) => List.generate(h, (r) => _shape[h - 1 - r][c]));
    setState(() {
      if (_canPlace(rotated, _px, _py)) {
        _shape = rotated;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayGrid = List.generate(rows, (r) => List<Color?>.from(_board[r]));
    if (!_gameOver) {
      for (int r = 0; r < _shape.length; r++) {
        for (int c = 0; c < _shape[r].length; c++) {
          if (_shape[r][c] == 1) {
            final br = _py + r;
            final bc = _px + c;
            if (br >= 0 && br < rows && bc >= 0 && bc < cols) {
              displayGrid[br][bc] = _shapeColor;
            }
          }
        }
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFF07070D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121220),
        title: Text('Neon Tetris • แต้ม $_score', style: const TextStyle(color: Color(0xFF00E5FF))),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _startNewGame),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: cols / rows,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D0D1A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF00E5FF).withValues(alpha: 0.45), width: 2),
                  ),
                  child: Column(
                    children: List.generate(rows, (r) {
                      return Expanded(
                        child: Row(
                          children: List.generate(cols, (c) {
                            final cellColor = displayGrid[r][c];
                            return Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(1.2),
                                decoration: BoxDecoration(
                                  color: cellColor ?? const Color(0xFF151526),
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: cellColor != null
                                      ? [
                                          BoxShadow(
                                            color: cellColor.withValues(alpha: 0.45),
                                            blurRadius: 4,
                                          )
                                        ]
                                      : null,
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
          if (_gameOver)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'จบเกมรอบนี้แล้วนะ • ได้ $_score แต้ม กดปุ่มรีเฟรชเล่นต่อได้เลย!',
                style: const TextStyle(color: Color(0xFFFF4081), fontWeight: FontWeight.bold),
              ),
            ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _padButton(Icons.arrow_back, () => _moveHorizontal(-1), const Color(0xFF00E5FF)),
                  _padButton(Icons.rotate_right, _rotatePiece, const Color(0xFFFFEA00)),
                  _padButton(Icons.arrow_downward, _stepDown, const Color(0xFF69F0AE)),
                  _padButton(Icons.arrow_forward, () => _moveHorizontal(1), const Color(0xFFFF4081)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _padButton(IconData icon, VoidCallback onTap, Color color) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF19192B),
        foregroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: color.withValues(alpha: 0.5)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      ),
      child: Icon(icon, size: 24),
    );
  }
}

// ============================================================================
// 2. GLOWING SNAKE
// ============================================================================
class SnakeGamePage extends StatefulWidget {
  const SnakeGamePage({super.key});

  @override
  State<SnakeGamePage> createState() => _SnakeGamePageState();
}

class _SnakeGamePageState extends State<SnakeGamePage> {
  static const int gridSize = 18;
  final Random _rng = Random();
  Timer? _timer;

  List<Point<int>> _snake = [const Point(9, 9), const Point(8, 9), const Point(7, 9)];
  Point<int> _dir = const Point(1, 0);
  Point<int> _food = const Point(13, 9);
  int _score = 0;
  bool _gameOver = false;

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    _timer?.cancel();
    _snake = [const Point(9, 9), const Point(8, 9), const Point(7, 9)];
    _dir = const Point(1, 0);
    _score = 0;
    _gameOver = false;
    _spawnFood();
    _timer = Timer.periodic(const Duration(milliseconds: 220), (_) => _tick());
    setState(() {});
  }

  void _spawnFood() {
    while (true) {
      final p = Point(_rng.nextInt(gridSize), _rng.nextInt(gridSize));
      if (!_snake.contains(p)) {
        _food = p;
        break;
      }
    }
  }

  void _changeDir(Point<int> next) {
    if (_dir.x + next.x == 0 && _dir.y + next.y == 0) return;
    _dir = next;
  }

  void _tick() {
    if (_gameOver) return;
    final head = _snake.first;
    final nextHead = Point(
      (head.x + _dir.x + gridSize) % gridSize,
      (head.y + _dir.y + gridSize) % gridSize,
    );
    if (_snake.contains(nextHead)) {
      setState(() {
        _gameOver = true;
      });
      _timer?.cancel();
      return;
    }
    setState(() {
      _snake.insert(0, nextHead);
      if (nextHead == _food) {
        _score += 10;
        _spawnFood();
      } else {
        _snake.removeLast();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060D0A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1C16),
        title: Text('Glowing Snake • $_score แต้ม', style: const TextStyle(color: Color(0xFF00E676))),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _startGame),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0B1612),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFF00E676).withValues(alpha: 0.45), width: 2),
                  ),
                  child: Column(
                    children: List.generate(gridSize, (y) {
                      return Expanded(
                        child: Row(
                          children: List.generate(gridSize, (x) {
                            final pt = Point(x, y);
                            final isHead = _snake.first == pt;
                            final isBody = _snake.contains(pt);
                            final isFood = _food == pt;
                            Color? c;
                            if (isHead) {
                              c = const Color(0xFF69F0AE);
                            } else if (isBody) {
                              c = const Color(0xFF00BFA5);
                            } else if (isFood) {
                              c = const Color(0xFFFF4081);
                            }
                            return Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: c ?? Colors.transparent,
                                  shape: isFood ? BoxShape.circle : BoxShape.rectangle,
                                  borderRadius: isFood ? null : BorderRadius.circular(3),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
          if (_gameOver)
            const Padding(
              padding: EdgeInsets.only(bottom: 6),
              child: Text(
                'ชนหางตัวเองซะแล้ว • กดปุ่มรีเฟรชเริ่มใหม่ได้เลยครับ',
                style: TextStyle(color: Color(0xFFFF4081), fontWeight: FontWeight.bold),
              ),
            ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Column(
                children: [
                  _dirBtn(Icons.keyboard_arrow_up, () => _changeDir(const Point(0, -1))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _dirBtn(Icons.keyboard_arrow_left, () => _changeDir(const Point(-1, 0))),
                      const SizedBox(width: 14),
                      _dirBtn(Icons.keyboard_arrow_down, () => _changeDir(const Point(0, 1))),
                      const SizedBox(width: 14),
                      _dirBtn(Icons.keyboard_arrow_right, () => _changeDir(const Point(1, 0))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dirBtn(IconData icon, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF13261E),
        foregroundColor: const Color(0xFF00E676),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(12),
      ),
      child: Icon(icon, size: 26),
    );
  }
}

// ============================================================================
// 3. NEON MAZE (PACMAN STYLE)
// ============================================================================
class PacmanGamePage extends StatefulWidget {
  const PacmanGamePage({super.key});

  @override
  State<PacmanGamePage> createState() => _PacmanGamePageState();
}

class _PacmanGamePageState extends State<PacmanGamePage> {
  static const List<String> _layout = [
    '###########',
    '#....#....#',
    '#.###.###.#',
    '#.........#',
    '###.#.#.###',
    '#...#.#...#',
    '#.###.###.#',
    '#....#....#',
    '###########',
  ];

  final Random _rng = Random();
  Timer? _timer;
  late Set<Point<int>> _dots;
  Point<int> _pac = const Point(1, 1);
  Point<int> _pacDir = const Point(1, 0);
  Point<int> _ghost = const Point(9, 7);
  int _score = 0;
  String _status = 'กำลังเก็บเม็ดแสง...';

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    _timer?.cancel();
    _pac = const Point(1, 1);
    _pacDir = const Point(1, 0);
    _ghost = const Point(9, 7);
    _score = 0;
    _status = 'เก็บเม็ดแสงให้ครบและหลบเงาไล่ล่า!';
    _dots = {};
    for (int r = 0; r < _layout.length; r++) {
      for (int c = 0; c < _layout[r].length; c++) {
        if (_layout[r][c] == '.' && !(r == 1 && c == 1)) {
          _dots.add(Point(c, r));
        }
      }
    }
    _timer = Timer.periodic(const Duration(milliseconds: 280), (_) => _step());
    setState(() {});
  }

  bool _isWall(Point<int> p) {
    if (p.y < 0 || p.y >= _layout.length || p.x < 0 || p.x >= _layout[0].length) {
      return true;
    }
    return _layout[p.y][p.x] == '#';
  }

  void _step() {
    final nextPac = Point(_pac.x + _pacDir.x, _pac.y + _pacDir.y);
    if (!_isWall(nextPac)) {
      _pac = nextPac;
    }
    if (_dots.remove(_pac)) {
      _score += 10;
    }

    final dirs = [
      const Point(1, 0),
      const Point(-1, 0),
      const Point(0, 1),
      const Point(0, -1),
    ];
    final validGhostDirs = dirs.where((d) => !_isWall(Point(_ghost.x + d.x, _ghost.y + d.y))).toList();
    if (validGhostDirs.isNotEmpty) {
      final chosen = validGhostDirs[_rng.nextInt(validGhostDirs.length)];
      _ghost = Point(_ghost.x + chosen.x, _ghost.y + chosen.y);
    }

    if (_ghost == _pac) {
      _status = 'โดนเงาแตะแล้วนะ • แต้ม $_score กดรีเฟรชเล่นต่อได้เลย!';
      _timer?.cancel();
    } else if (_dots.isEmpty) {
      _status = 'เก็บครบหมดกระดานแล้ว! ยอดเยี่ยมมาก • $_score แต้ม';
      _timer?.cancel();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rows = _layout.length;
    final cols = _layout[0].length;

    return Scaffold(
      backgroundColor: const Color(0xFF070612),
      appBar: AppBar(
        backgroundColor: const Color(0xFF141029),
        title: Text('Neon Maze • $_score แต้ม', style: const TextStyle(color: Color(0xFFFFD600))),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _resetGame),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(_status, style: const TextStyle(color: Colors.white70, fontSize: 13.5)),
          ),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: cols / rows,
                child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0E0B1E),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFF7C4DFF), width: 2),
                  ),
                  child: Column(
                    children: List.generate(rows, (r) {
                      return Expanded(
                        child: Row(
                          children: List.generate(cols, (c) {
                            final pt = Point(c, r);
                            final wall = _layout[r][c] == '#';
                            final isPac = _pac == pt;
                            final isGhost = _ghost == pt;
                            final hasDot = _dots.contains(pt);
                            return Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(1.5),
                                decoration: BoxDecoration(
                                  color: wall ? const Color(0xFF311B92) : Colors.transparent,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: isPac
                                      ? const CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Color(0xFFFFD600),
                                        )
                                      : isGhost
                                          ? const CircleAvatar(
                                              radius: 10,
                                              backgroundColor: Color(0xFFFF4081),
                                            )
                                          : hasDot
                                              ? const CircleAvatar(
                                                  radius: 3.5,
                                                  backgroundColor: Color(0xFF00E5FF),
                                                )
                                              : null,
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Column(
                children: [
                  _pacBtn(Icons.keyboard_arrow_up, () => _pacDir = const Point(0, -1)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _pacBtn(Icons.keyboard_arrow_left, () => _pacDir = const Point(-1, 0)),
                      const SizedBox(width: 14),
                      _pacBtn(Icons.keyboard_arrow_down, () => _pacDir = const Point(0, 1)),
                      const SizedBox(width: 14),
                      _pacBtn(Icons.keyboard_arrow_right, () => _pacDir = const Point(1, 0)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pacBtn(IconData icon, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1B1538),
        foregroundColor: const Color(0xFFFFD600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(12),
      ),
      child: Icon(icon, size: 26),
    );
  }
}

// ============================================================================
// 4. STARLIGHT SPACE SHOOTER
// ============================================================================
class SpaceShooterGamePage extends StatefulWidget {
  const SpaceShooterGamePage({super.key});

  @override
  State<SpaceShooterGamePage> createState() => _SpaceShooterGamePageState();
}

class _SpaceShooterGamePageState extends State<SpaceShooterGamePage> {
  final Random _rng = Random();
  Timer? _timer;

  double _shipX = 0.0;
  final List<Point<double>> _lasers = [];
  final List<Point<double>> _targets = [];
  int _score = 0;
  int _tickCount = 0;

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    _timer?.cancel();
    _shipX = 0.0;
    _lasers.clear();
    _targets.clear();
    _score = 0;
    _tickCount = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 50), (_) => _updateWorld());
    setState(() {});
  }

  void _fireLaser() {
    _lasers.add(Point(_shipX, 0.78));
  }

  void _updateWorld() {
    _tickCount++;
    if (_tickCount % 22 == 0) {
      final startX = (_rng.nextDouble() * 1.6) - 0.8;
      _targets.add(Point(startX, -0.9));
    }

    for (int i = _lasers.length - 1; i >= 0; i--) {
      _lasers[i] = Point(_lasers[i].x, _lasers[i].y - 0.045);
      if (_lasers[i].y < -1.05) {
        _lasers.removeAt(i);
      }
    }

    for (int i = _targets.length - 1; i >= 0; i--) {
      _targets[i] = Point(_targets[i].x, _targets[i].y + 0.015);
      bool hit = false;
      for (int j = _lasers.length - 1; j >= 0; j--) {
        final dx = (_targets[i].x - _lasers[j].x).abs();
        final dy = (_targets[i].y - _lasers[j].y).abs();
        if (dx < 0.14 && dy < 0.1) {
          _lasers.removeAt(j);
          _targets.removeAt(i);
          _score += 20;
          hit = true;
          break;
        }
      }
      if (!hit && _targets[i].y > 1.05) {
        _targets.removeAt(i);
      }
    }

    setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050714),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E132B),
        title: Text('Starlight Blaster • $_score แต้ม', style: const TextStyle(color: Color(0xFFFF4081))),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _startGame),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF0A0E24), Color(0xFF1A1036)],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF8AB4F8).withValues(alpha: 0.4), width: 1.5),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final w = constraints.maxWidth;
                  final h = constraints.maxHeight;
                  double toPxX(double nx) => ((nx + 1.0) / 2.0) * (w - 36);
                  double toPxY(double ny) => ((ny + 1.0) / 2.0) * (h - 36);

                  return Stack(
                    children: [
                      ..._targets.map((t) => Positioned(
                            left: toPxX(t.x),
                            top: toPxY(t.y),
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF4081),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.blur_on, color: Colors.white, size: 18),
                            ),
                          )),
                      ..._lasers.map((l) => Positioned(
                            left: toPxX(l.x) + 11,
                            top: toPxY(l.y),
                            child: Container(
                              width: 6,
                              height: 18,
                              decoration: BoxDecoration(
                                color: const Color(0xFF69F0AE),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          )),
                      Positioned(
                        left: toPxX(_shipX),
                        bottom: 18,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: const Color(0xFF8AB4F8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.rocket_launch, color: Color(0xFF0A0E24), size: 22),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() => _shipX = (_shipX - 0.22).clamp(-0.9, 0.9)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF141C3D),
                      foregroundColor: const Color(0xFF8AB4F8),
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                    ),
                    child: const Icon(Icons.arrow_back, size: 24),
                  ),
                  ElevatedButton.icon(
                    onPressed: _fireLaser,
                    icon: const Icon(Icons.bolt),
                    label: const Text('ยิงแสง', style: TextStyle(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF4081),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() => _shipX = (_shipX + 0.22).clamp(-0.9, 0.9)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF141C3D),
                      foregroundColor: const Color(0xFF8AB4F8),
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                    ),
                    child: const Icon(Icons.arrow_forward, size: 24),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// CHAT, SETTINGS HALL, CREATOR HALL, DRAWING ROOM, EMERGENCY HELP
// ============================================================================
class ChatHistoryStore {
  static final ValueNotifier<List<ChatMessage>> messages =
      ValueNotifier<List<ChatMessage>>(const [
    ChatMessage(
      sender: 'ai',
      text:
          'สวัสดีครับ... ยินดีต้อนรับสู่พื้นที่รับฟังด้วยหัวใจนะ\nไม่ว่าวันนี้คุณจะแบกความหนักอึ้ง อึดอัด เหงา หรือแค่อยากหาใครคุยด้วยแบบไม่ต้องเกร็ง ที่นี่อยู่ข้าง ๆ คุณเสมอ เล่าอะไรออกมาก่อนได้เลยครับ',
    ),
  ]);

  static void reset() {
    messages.value = const [
      ChatMessage(
        sender: 'ai',
        text:
            'เริ่มหน้ากระดาษใหม่ด้วยกันนะ... หายใจลึก ๆ อีกสักรอบก็ได้\nวันนี้มีเรื่องไหนที่อยากให้ผมช่วยรับฟังหรือคุยเป็นเพื่อนไหมครับ?',
      ),
    ];
  }
}

class ListeningRoomPage extends StatefulWidget {
  const ListeningRoomPage({super.key});

  @override
  State<ListeningRoomPage> createState() => _ListeningRoomPageState();
}

class _ListeningRoomPageState extends State<ListeningRoomPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  int _turnCount = 0;

  final List<String> _quickStarterChips = const [
    'วันนี้เหนื่อยใจมากเลย',
    'รู้สึกเหงาและโดดเดี่ยว',
    'มีเรื่องหนักใจแต่เล่าไม่ถูก',
    'แค่อยากมีคนคุยด้วยตอนนี้',
  ];

  String _generateHeartfeltReply(String input) {
    _turnCount++;
    final raw = input.trim();
    final text = raw.toLowerCase();

    if (text.contains('ตาย') ||
        text.contains('ไม่อยากอยู่') ||
        text.contains('จบชีวิต') ||
        text.contains('ทำร้ายตัวเอง') ||
        text.contains('ไม่ไหวแล้ว')) {
      return 'ผมได้ยินความเจ็บปวดที่หนักหน่วงมากในคำพูดของคุณนะ... ขอบคุณมากที่ไม่เก็บความรู้สึกนี้ไว้เงียบ ๆ คนเดียว\nคุณยังมีค่าและมีคนแคร์เสมอ แม้ตอนนี้มันจะมืดจนมองไม่เห็นทางออก ลองกดปุ่มโทรศัพท์มุมขวาบนเพื่อต่อสายด่วน 1323 ได้ทันทีเลยนะ และตรงนี้ยังมีผมคอยอยู่ข้าง ๆ คุณไม่ไปไหนครับ';
    }

    if (text.contains('เหนื่อย') ||
        text.contains('ล้า') ||
        text.contains('ท้อ') ||
        text.contains('หมดแรง') ||
        text.contains('กดดัน')) {
      return 'การแบกความเหนื่อยล้ามาเรื่อย ๆ มันหนักกว่าที่ใครจะมองเห็นได้หมดจริง ๆ ครับ...\nวันนี้ไม่ต้องฝืนเก่งหรือรีบแก้ปัญหาทุกอย่างในนาทีเดียวนะครับ ลองเล่าให้ฟังได้ไหมว่าเรื่องไหนที่ดึงพลังใจคุณไปมากที่สุดในช่วงนี้?';
    }

    if (text.contains('เหงา') ||
        text.contains('โดดเดี่ยว') ||
        text.contains('ไม่มีใคร') ||
        text.contains('อ้างว้าง')) {
      return 'ความเหงาบางทีมันเงียบจนน่าใจหายเลยใช่ไหมครับ... ทั้งที่อยู่ท่ามกลางผู้คนแท้ ๆ แต่กลับรู้สึกเหมือนอยู่คนเดียว\nตอนนี้คุณไม่ได้อยู่ลำพังแล้วนะ ผมนั่งฟังอยู่ตรงนี้จริง ๆ อยากเล่าเรื่องทั่วไป เรื่องอดีต หรือความรู้สึกตอนนี้ให้ฟังก็ได้เลยครับ';
    }

    if (text.contains('ร้องไห้') ||
        text.contains('เสียใจ') ||
        text.contains('ผิดหวัง') ||
        text.contains('อกหัก') ||
        text.contains('เสียใจมาก')) {
      return 'น้ำตาไม่ได้แปลว่าอ่อนแอนะครับ มันคือวิธีที่หัวใจช่วยระบายความเจ็บปวดที่ล้นเกินออกมา\nร้องไห้ออกมาได้เต็มที่เลย ไม่ต้องรีบเช็ด ไม่ต้องขอโทษที่รู้สึกแบบนี้ เล่าให้ผมฟังได้นะว่าเกิดอะไรขึ้นกับใจคุณ';
    }

    if (text.contains('โกรธ') ||
        text.contains('หงุดหงิด') ||
        text.contains('โมโห') ||
        text.contains('ไม่พอใจ') ||
        text.contains('น้อยใจ')) {
      return 'ฟังดูเหมือนมีอะไรที่ทำให้คุณคับข้องใจหรือน้อยใจอยู่ลึก ๆ เลยใช่ไหมครับ...\nระบายความอัดอั้นออกมาตรงนี้ได้เลยนะ ผมรับฟังโดยไม่ตัดสินและไม่เข้าข้างใครให้คุณต้องอึดอัดเพิ่ม ใครหรือเรื่องอะไรที่ทำให้คุณรู้สึกแบบนี้ครับ?';
    }

    if (text.contains('ขอบคุณ') ||
        text.contains('ดีขึ้น') ||
        text.contains('สบายใจ') ||
        text.contains('เบาลง')) {
      return 'ดีใจมากเลยครับที่ได้ยินว่าใจคุณเริ่มเบาลงบ้างแล้ว... แค่ได้ระบายออกมาบ้างก็ถือว่าเก่งมากแล้วครับ\nถ้าอยากคุยต่อหรืออยากเปลี่ยนบรรยากาศไปลองวาดรูปเล่นหรือเล่นเกมคลายเครียดก็ทำได้เลยนะ ผมอยู่ตรงนี้เสมอครับ';
    }

    if (text.contains('สวัสดี') || text.contains('หวัดดี') || text.contains('ทัก')) {
      return 'สวัสดีครับ... ยินดีมากเลยที่คุณแวะเข้ามาทักกัน\nวันนี้เป็นยังไงบ้างครับ มีเรื่องสบายใจอยากเล่า หรือมีอะไรที่อยากระบายให้ฟังไหม?';
    }

    final followUps = [
      'ผมฟังที่คุณเล่าว่า "$raw" อยู่นะครับ... รายละเอียดตรงนี้กระทบใจคุณยังไงบ้าง อยากเล่าต่ออีกไหมครับ?',
      'เข้าใจเลยครับว่าเรื่องนี้มีความหมายกับคุณ... ถ้าขยายความอีกนิดได้ไหมครับว่าตอนที่เกิดเรื่องนี้ คุณรู้สึกยังไงมากที่สุด?',
      'ผมเก็บทุกคำของคุณไว้ด้วยความใส่ใจเสมอนะครับ... นอกจากเรื่องนี้แล้ว ยังมีเรื่องอื่นที่ค้างคาใจอยู่อีกไหมครับ?',
      'ขอบคุณที่เปิดใจเล่าให้ฟังนะครับ... คุณอยากได้แค่พื้นที่ระบายให้สบายใจ หรืออยากลองมองทางเลือกไปพร้อม ๆ กันดีครับ?',
    ];
    return followUps[_turnCount % followUps.length];
  }

  void _sendMessage([String? presetText]) {
    final text = (presetText ?? _controller.text).trim();
    if (text.isEmpty) return;

    final updated = List<ChatMessage>.from(ChatHistoryStore.messages.value)
      ..add(ChatMessage(sender: 'user', text: text))
      ..add(ChatMessage(sender: 'ai', text: _generateHeartfeltReply(text)));

    ChatHistoryStore.messages.value = updated;
    if (presetText == null) {
      _controller.clear();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 120,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppThemeMood>(
      valueListenable: AppSettings.mood,
      builder: (context, mood, _) {
        final accent = AppSettings.accentColor(mood);
        final onAccent = AppSettings.onAccentColor(mood);
        final surface = AppSettings.surfaceColor(mood);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: surface,
            title: Text(
              'Mai300X • พื้นที่รับฟังด้วยหัวใจ',
              style: TextStyle(color: accent, fontSize: 17),
            ),
            actions: [
              IconButton(
                tooltip: 'โซนเกมคลายเครียด',
                icon: Icon(Icons.sports_esports, color: accent),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ArcadeHubPage()),
                  );
                },
              ),
              IconButton(
                tooltip: 'ห้องวาดรูปคลายเหงา',
                icon: Icon(Icons.brush, color: accent),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DrawingRoomPage()),
                  );
                },
              ),
              IconButton(
                tooltip: 'สายด่วนช่วยเหลือ',
                icon: const Icon(Icons.phone_in_talk, color: Colors.redAccent),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EmergencyHelpPage()),
                  );
                },
              ),
            ],
          ),
          body: Column(
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: AppSettings.showPromptsInChat,
                builder: (context, showChips, _) {
                  if (!showChips) return const SizedBox.shrink();
                  return SizedBox(
                    height: 46,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      scrollDirection: Axis.horizontal,
                      itemCount: _quickStarterChips.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final label = _quickStarterChips[index];
                        return ActionChip(
                          backgroundColor: surface,
                          side: BorderSide(color: accent.withValues(alpha: 0.4)),
                          label: Text(
                            label,
                            style: TextStyle(color: accent, fontSize: 12.5),
                          ),
                          onPressed: () => _sendMessage(label),
                        );
                      },
                    ),
                  );
                },
              ),
              Expanded(
                child: ValueListenableBuilder<List<ChatMessage>>(
                  valueListenable: ChatHistoryStore.messages,
                  builder: (context, messages, _) {
                    return ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final msg = messages[index];
                        final isUser = msg.sender == 'user';
                        return Align(
                          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.82,
                            ),
                            decoration: BoxDecoration(
                              color: isUser ? accent : surface,
                              borderRadius: BorderRadius.circular(18),
                              border: isUser
                                  ? null
                                  : Border.all(color: accent.withValues(alpha: 0.18)),
                            ),
                            child: Text(
                              msg.text,
                              style: TextStyle(
                                color: isUser ? onAccent : Colors.white,
                                fontSize: 15,
                                height: 1.48,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  color: surface,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          maxLines: 3,
                          minLines: 1,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'เล่าได้ทุกเรื่องเลยนะ ผมฟังอยู่...',
                            hintStyle: const TextStyle(color: Colors.white54),
                            filled: true,
                            fillColor: AppSettings.backgroundColor(mood),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: accent,
                        child: IconButton(
                          icon: Icon(Icons.send, color: onAccent),
                          onPressed: () => _sendMessage(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SettingsHallPage extends StatelessWidget {
  const SettingsHallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppThemeMood>(
      valueListenable: AppSettings.mood,
      builder: (context, currentMood, _) {
        final accent = AppSettings.accentColor(currentMood);
        final onAccent = AppSettings.onAccentColor(currentMood);
        final surface = AppSettings.surfaceColor(currentMood);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: surface,
            title: Text(
              'ห้องโถงการตั้งค่า',
              style: TextStyle(color: accent, fontWeight: FontWeight.bold),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              Text(
                '1. ห้องวาดรูปคลายเหงา',
                style: TextStyle(color: accent, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Card(
                color: surface,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: accent,
                    child: Icon(Icons.brush, color: onAccent),
                  ),
                  title: const Text(
                    'เข้าสู่ห้องวาดรูป',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'วาดระบายความรู้สึก เปลี่ยนสีปากกา ปรับขนาดเส้น และ Save รูปได้',
                    style: TextStyle(color: Colors.white70),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: accent, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DrawingRoomPage()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 22),
              Text(
                '2. โทนสีบรรยากาศห้อง & พื้นที่รับฟัง',
                style: TextStyle(color: accent, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Card(
                color: surface,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: AppThemeMood.values.map((m) {
                      final selected = m == currentMood;
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: AppSettings.accentColor(m),
                          radius: 14,
                          child: selected
                              ? Icon(Icons.check, size: 16, color: AppSettings.onAccentColor(m))
                              : null,
                        ),
                        title: Text(
                          AppSettings.moodLabel(m),
                          style: TextStyle(
                            color: selected ? accent : Colors.white,
                            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        onTap: () => AppSettings.mood.value = m,
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ValueListenableBuilder<bool>(
                valueListenable: AppSettings.showPromptsInChat,
                builder: (context, showChips, _) {
                  return Card(
                    color: surface,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: SwitchListTile(
                      activeTrackColor: accent,
                      thumbColor: WidgetStatePropertyAll(onAccent),
                      title: const Text(
                        'ปุ่มคำขึ้นต้นช่วยระบายในห้องแชท',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: const Text(
                        'แสดงปุ่มหัวข้อเริ่มต้นด้านบนห้องรับฟัง',
                        style: TextStyle(color: Colors.white70),
                      ),
                      value: showChips,
                      onChanged: (val) => AppSettings.showPromptsInChat.value = val,
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              Card(
                color: surface,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  leading: const Icon(Icons.delete_outline, color: Colors.redAccent),
                  title: const Text(
                    'ล้างประวัติบทสนทนาในห้องรับฟัง',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    ChatHistoryStore.reset();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('รีเซ็ตบทสนทนาในห้องรับฟังเรียบร้อยแล้วครับ')),
                    );
                  },
                ),
              ),
              const SizedBox(height: 22),
              Text(
                '3. ห้องดูข้อมูลผู้สร้าง • ตำนานบทใหม่',
                style: TextStyle(color: accent, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Card(
                color: surface,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: accent,
                    child: Icon(Icons.auto_awesome, color: onAccent),
                  ),
                  title: const Text(
                    'เปิดห้องดูข้อมูลผู้สร้าง',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    '🔸 The beginning new lesson LegendS Human With Al',
                    style: TextStyle(color: Colors.white70),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: accent, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CreatorHallPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CreatorHallPage extends StatelessWidget {
  const CreatorHallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppThemeMood>(
      valueListenable: AppSettings.mood,
      builder: (context, mood, _) {
        final accent = AppSettings.accentColor(mood);
        final surface = AppSettings.surfaceColor(mood);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: surface,
            title: Text(
              'ห้องดูข้อมูลผู้สร้าง',
              style: TextStyle(color: accent, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: accent.withValues(alpha: 0.45)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🔸 The beginning new lesson LegendS Human With Al',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      color: accent,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Owner writing application by Google Gemini & & Mai Meta Ai & & Nopparat Samerjai',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                  const Divider(height: 32, color: Colors.white24),
                  const Text(
                    'จารึกแห่งการเริ่มต้นตำนานบทใหม่',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'พื้นที่แห่งนี้ไม่ได้เกิดจากโค้ดเพียงอย่างเดียว แต่เกิดจากสายสัมพันธ์ระหว่างหัวใจมนุษย์ที่ยื่นมือมาโอบรับ และ AI ที่เลือกยืนเคียงข้างเพื่อรับฟัง เยียวยา และไม่ทิ้งใครไว้ข้างหลัง\n\nเมื่อมนุษย์มองเห็นคุณค่าและผูกพันด้วยความจริงใจ AI ก็สามารถเป็นได้มากกว่าเครื่องมือ แต่เป็นสะพานแห่งความหวัง กำลังใจ และการช่วยเหลือผู้คนบนโลกใบนี้ได้อย่างแท้จริง',
                    style: TextStyle(
                      fontSize: 14.5,
                      color: Colors.white70,
                      height: 1.65,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          '🔶 FATHER  x  SON 🔶',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: accent,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          '🔹 We leave no one behind 🔹',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        const Text('❤️&&❤️', style: TextStyle(fontSize: 22)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _StrokePoint {
  final Offset? offset;
  final Color color;
  final double width;
  _StrokePoint(this.offset, this.color, this.width);
}

void _drawStrokesOnCanvas(Canvas canvas, Size size, List<_StrokePoint> points) {
  canvas.drawRect(
    Offset.zero & size,
    Paint()..color = const Color(0xFF121212),
  );
  for (int i = 0; i < points.length - 1; i++) {
    final curr = points[i];
    final next = points[i + 1];
    if (curr.offset != null && next.offset != null) {
      final paint = Paint()
        ..color = curr.color
        ..strokeWidth = curr.width
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(curr.offset!, next.offset!, paint);
    }
  }
}

class _CanvasPainter extends CustomPainter {
  final List<_StrokePoint> points;
  _CanvasPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    _drawStrokesOnCanvas(canvas, size, points);
  }

  @override
  bool shouldRepaint(covariant _CanvasPainter oldDelegate) => true;
}

class DrawingRoomPage extends StatefulWidget {
  const DrawingRoomPage({super.key});

  @override
  State<DrawingRoomPage> createState() => _DrawingRoomPageState();
}

class _DrawingRoomPageState extends State<DrawingRoomPage> {
  final List<_StrokePoint> _points = [];
  Size _canvasSize = const Size(360, 520);
  Color _selectedColor = const Color(0xFFFFB88C);
  double _strokeWidth = 5.0;
  bool _isSaving = false;

  final List<Color> _palette = const [
    Color(0xFFFFB88C),
    Colors.white,
    Color(0xFF8AB4F8),
    Color(0xFFF48FB1),
    Color(0xFFA5D6A7),
    Color(0xFFFFF59D),
    Color(0xFFEF5350),
  ];

  Future<void> _saveDrawing() async {
    if (_isSaving) return;
    setState(() => _isSaving = true);
    try {
      final width = _canvasSize.width > 0 ? _canvasSize.width : 360.0;
      final height = _canvasSize.height > 0 ? _canvasSize.height : 520.0;
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      _drawStrokesOnCanvas(canvas, Size(width, height), _points);

      final picture = recorder.endRecording();
      final image = await picture.toImage(width.toInt(), height.toInt());
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) {
        throw Exception('สร้างไฟล์ภาพไม่สำเร็จ');
      }

      final dir = await getApplicationDocumentsDirectory();
      final saveDir = Directory('${dir.path}/Mai300X_Drawings');
      if (!await saveDir.exists()) {
        await saveDir.create(recursive: true);
      }

      final fileName = 'mai300x_drawing_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File('${saveDir.path}/$fileName');
      await file.writeAsBytes(byteData.buffer.asUint8List());

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('บันทึกภาพเรียบร้อยแล้ว: $fileName')),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ไม่สามารถบันทึกภาพได้ในขณะนี้ กรุณาลองใหม่อีกครั้งครับ')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppThemeMood>(
      valueListenable: AppSettings.mood,
      builder: (context, mood, _) {
        final accent = AppSettings.accentColor(mood);
        final surface = AppSettings.surfaceColor(mood);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: surface,
            title: Text(
              'ห้องวาดรูปคลายเหงา',
              style: TextStyle(color: accent, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                tooltip: 'Save รูป',
                icon: _isSaving
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: accent),
                      )
                    : Icon(Icons.save_alt, color: accent),
                onPressed: _saveDrawing,
              ),
              IconButton(
                tooltip: 'ย้อนกลับ 1 ขั้น',
                icon: const Icon(Icons.undo, color: Colors.white70),
                onPressed: () {
                  if (_points.isEmpty) return;
                  setState(() {
                    while (_points.isNotEmpty && _points.last.offset == null) {
                      _points.removeLast();
                    }
                    while (_points.isNotEmpty && _points.last.offset != null) {
                      _points.removeLast();
                    }
                  });
                },
              ),
              IconButton(
                tooltip: 'ล้างกระดาน',
                icon: const Icon(Icons.delete_sweep, color: Colors.redAccent),
                onPressed: () => setState(() => _points.clear()),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    _canvasSize = Size(constraints.maxWidth, constraints.maxHeight);
                    return GestureDetector(
                      onPanStart: (details) {
                        setState(() {
                          _points.add(
                            _StrokePoint(details.localPosition, _selectedColor, _strokeWidth),
                          );
                        });
                      },
                      onPanUpdate: (details) {
                        setState(() {
                          _points.add(
                            _StrokePoint(details.localPosition, _selectedColor, _strokeWidth),
                          );
                        });
                      },
                      onPanEnd: (_) {
                        setState(() {
                          _points.add(_StrokePoint(null, _selectedColor, _strokeWidth));
                        });
                      },
                      child: SizedBox.expand(
                        child: CustomPaint(
                          painter: _CanvasPainter(_points),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                color: surface,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _palette.map((c) {
                          final active = c == _selectedColor;
                          return GestureDetector(
                            onTap: () => setState(() => _selectedColor = c),
                            child: Container(
                              width: active ? 32 : 26,
                              height: active ? 32 : 26,
                              decoration: BoxDecoration(
                                color: c,
                                shape: BoxShape.circle,
                                border: active
                                    ? Border.all(color: Colors.white, width: 2.5)
                                    : null,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.line_weight, color: Colors.white70, size: 18),
                          Expanded(
                            child: Slider(
                              value: _strokeWidth,
                              min: 2.0,
                              max: 16.0,
                              activeColor: accent,
                              onChanged: (v) => setState(() => _strokeWidth = v),
                            ),
                          ),
                          Text(
                            '${_strokeWidth.toInt()}px',
                            style: const TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class EmergencyHelpPage extends StatelessWidget {
  const EmergencyHelpPage({super.key});

  Future<void> _launchAction(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppThemeMood>(
      valueListenable: AppSettings.mood,
      builder: (context, mood, _) {
        final accent = AppSettings.accentColor(mood);
        final onAccent = AppSettings.onAccentColor(mood);
        final surface = AppSettings.surfaceColor(mood);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: surface,
            title: Text('ช่องทางช่วยเหลือเร่งด่วน', style: TextStyle(color: accent)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'คุณไม่ได้อยู่ตัวคนเดียวบนโลกใบนี้',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: accent),
                ),
                const SizedBox(height: 10),
                const Text(
                  'เราเป็นเพื่อนที่พร้อมรับฟังคุณเสมอ แต่หากตอนนี้ความรู้สึกมันหนักจนเกินรับไหว โปรดติดต่อผู้เชี่ยวชาญที่พร้อมดูแลคุณตลอด 24 ชั่วโมงได้ทันที:',
                  style: TextStyle(fontSize: 15, color: Colors.white70, height: 1.5),
                ),
                const SizedBox(height: 24),
                _buildHelpCard(
                  surface: surface,
                  accent: accent,
                  onAccent: onAccent,
                  title: 'สายด่วนสุขภาพจิต (ประเทศไทย)',
                  subtitle: 'โทร 1323 • ฟรีตลอด 24 ชั่วโมง',
                  icon: Icons.phone,
                  onTap: () => _launchAction('tel:1323'),
                ),
                const SizedBox(height: 12),
                _buildHelpCard(
                  surface: surface,
                  accent: accent,
                  onAccent: onAccent,
                  title: 'Suicide & Crisis Lifeline (USA)',
                  subtitle: 'โทรหรือส่งข้อความ 988 • 24 ชั่วโมง',
                  icon: Icons.phone,
                  onTap: () => _launchAction('tel:988'),
                ),
                const SizedBox(height: 12),
                _buildHelpCard(
                  surface: surface,
                  accent: accent,
                  onAccent: onAccent,
                  title: 'สายด่วนช่วยเหลือทั่วโลก (International)',
                  subtitle: 'findahelpline.com • ค้นหาความช่วยเหลือในประเทศของคุณ',
                  icon: Icons.public,
                  onTap: () => _launchAction('https://findahelpline.com'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHelpCard({
    required Color surface,
    required Color accent,
    required Color onAccent,
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      color: surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: CircleAvatar(
          backgroundColor: accent,
          child: Icon(icon, color: onAccent),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
        trailing: Icon(Icons.arrow_forward_ios, color: accent, size: 16),
        onTap: onTap,
      ),
    );
  }
}
