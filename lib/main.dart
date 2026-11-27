import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const Mai300XHeart());

enum AppThemeMood { peachyDusk, midnightCalm, warmRose }

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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 28),
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
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
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
                    const SizedBox(height: 14),
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
                        label: Text(
                          'ห้องโถงการตั้งค่า • วาดรูป & ข้อมูลผู้สร้าง',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppSettings.surfaceColor(mood),
                          side: BorderSide(color: accent.withValues(alpha: 0.45), width: 1),
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
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
                    const SizedBox(height: 28),
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

class ChatHistoryStore {
  static final ValueNotifier<List>> messages =
      ValueNotifier<List>>([
    {
      'sender': 'ai',
      'text':
          'สวัสดีครับ... ยินดีต้อนรับสู่พื้นที่รับฟังด้วยหัวใจนะ\nไม่ว่าวันนี้คุณจะแบกความหนักอึ้ง อึดอัด เหงา หรือแค่อยากหาใครคุยด้วยแบบไม่ต้องเกร็ง ที่นี่อยู่ข้าง ๆ คุณเสมอ เล่าอะไรออกมาก่อนได้เลยครับ'
    }
  ]);

  static void reset() {
    messages.value = [
      {
        'sender': 'ai',
        'text':
            'เริ่มหน้ากระดาษใหม่ด้วยกันนะ... หายใจลึก ๆ อีกสักรอบก็ได้\nวันนี้มีเรื่องไหนที่อยากให้ผมช่วยรับฟังหรือคุยเป็นเพื่อนไหมครับ?'
      }
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
      return 'ดีใจมากเลยครับที่ได้ยินว่าใจคุณเริ่มเบาลงบ้างแล้ว... แค่ได้ระบายออกมาบ้างก็ถือว่าเก่งมากแล้วครับ\nถ้าอยากคุยต่อหรืออยากเปลี่ยนบรรยากาศไปลองวาดรูปเล่นในห้องวาดรูปก็ทำได้เลยนะ ผมอยู่ตรงนี้เสมอครับ';
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

    final updated = List>.from(ChatHistoryStore.messages.value)
      ..add({'sender': 'user', 'text': text})
      ..add({'sender': 'ai', 'text': _generateHeartfeltReply(text)});

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
                tooltip: 'การตั้งค่าโทนสีห้อง',
                icon: const Icon(Icons.palette_outlined, color: Colors.white70),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsHallPage()),
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
                child: ValueListenableBuilder<List>>(
                  valueListenable: ChatHistoryStore.messages,
                  builder: (context, messages, _) {
                    return ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final msg = messages[index];
                        final isUser = msg['sender'] == 'user';
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
                              msg['text'] ?? '',
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
                    'วาดระบายความรู้สึก เปลี่ยนสีปากกา ปรับขนาดเส้นได้อิสระ',
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

class _CanvasPainter extends CustomPainter {
  final List<_StrokePoint> points;
  _CanvasPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
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
  Color _selectedColor = const Color(0xFFFFB88C);
  double _strokeWidth = 5.0;

  final List<Color> _palette = const [
    Color(0xFFFFB88C),
    Colors.white,
    Color(0xFF8AB4F8),
    Color(0xFFF48FB1),
    Color(0xFFA5D6A7),
    Color(0xFFFFF59D),
    Color(0xFFEF5350),
  ];

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
                child: GestureDetector(
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
