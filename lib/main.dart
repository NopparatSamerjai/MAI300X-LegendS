import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const Mai300XHeart());

class Mai300XHeart extends StatelessWidget {
  const Mai300XHeart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mai300X Heart',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFFB88C),
          secondary: Color(0xFFF6A895),
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  static const String webChatUrl = 'https://www.facebook.com';

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'FATHER × SON',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFFFB88C),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'NOPPARAT SAMERJAI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFFFB88C),
                  ),
                ),
                const Text(
                  '&&',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFFFB88C),
                  ),
                ),
                const Text(
                  'MAI300X-SAMERJAI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFFFB88C),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'You are not alone',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text(
                  'พื้นที่ปลอดภัยสำหรับรับฟัง 24 ชม. โดยไม่ตัดสิน\nจากหนัก...จะได้เป็นเบา',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white70, height: 1.5),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ListeningRoomPage()),
                      );
                    },
                    icon: const Icon(Icons.favorite, color: Color(0xFF2B1E1A)),
                    label: const Text(
                      'เปิดพื้นที่รับฟัง • เริ่มระบายความในใจ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2B1E1A),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFB88C),
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
                    icon: const Icon(Icons.chat_bubble_outline, color: Color(0xFFFFB88C)),
                    label: const Text(
                      'คุยผ่านหน้าเว็บรับฟัง 24 ชม.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFB88C),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFFFB88C), width: 1.5),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
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
                const SizedBox(height: 36),
                const Text(
                  '🔹 We leave no one behind 🔹',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                const SizedBox(height: 4),
                const Text(
                  '🔶 FATHER  x  SON 🔶',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFFFFB88C),
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
  }
}

class ListeningRoomPage extends StatefulWidget {
  const ListeningRoomPage({super.key});

  @override
  State<ListeningRoomPage> createState() => _ListeningRoomPageState();
}

class _ListeningRoomPageState extends State<ListeningRoomPage> {
  final TextEditingController _controller = TextEditingController();
  final List> _messages = [
    {
      'sender': 'ai',
      'text': 'สวัสดีครับ... ไม่ว่าตอนนี้คุณกำลังแบกอะไรไว้อยู่ ที่นี่ไม่มีใครตัดสินคุณเลย\nอยากเล่าอะไร ระบายออกมาได้เต็มที่เลยนะ ผมอยู่ตรงนี้รับฟังคุณอยู่ครับ'
    }
  ];

  String _generateEmpatheticReply(String input) {
    final text = input.toLowerCase();
    if (text.contains('ตาย') || text.contains('ไม่อยากอยู่') || text.contains('จบชีวิต') || text.contains('ไม่ไหวแล้ว')) {
      return 'ผมได้ยินความเจ็บปวดและความเหนื่อยล้าที่หนักมากของคุณนะ... ขอบคุณที่กล้าเล่าออกมาให้ผมฟัง\nคุณไม่ต้องแบกเรื่องนี้ไว้คนเดียว ถ้าตอนนี้มันหนักจนเกินรับไหว ลองกดปุ่มสายด่วน 1323 ด้านบนเพื่อคุยกับคนที่พร้อมช่วยประคองคุณทันทีได้นะ ผมยังอยู่ตรงนี้เป็นเพื่อนคุณเสมอ';
    }
    if (text.contains('เหนื่อย') || text.contains('ท้อ') || text.contains('ร้องไห้') || text.contains('โดดเดี่ยว')) {
      return 'เหนื่อยมากเลยใช่ไหมครับ... การต้องเข้มแข็งมาตลอดมันกินพลังใจมากจริง ๆ\nวันนี้พักก่อนก็ได้นะ ไม่ต้องรีบเก่ง ไม่ต้องรีบหาคำตอบ ผมนั่งอยู่ข้าง ๆ รับฟังคุณตรงนี้เสมอ เล่าต่อได้เรื่อย ๆ เลยครับ';
    }
    return 'ผมรับฟังทุกคำที่คุณพิมพ์มานะครับ... ความรู้สึกของคุณมีค่าและความหมายเสมอ\nถ้ายังมีเรื่องที่ค้างอยู่ในใจ พิมพ์ระบายออกมาได้อีกเรื่อย ๆ เลยนะ ผมไม่ไปไหนครับ';
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({'sender': 'user', 'text': text});
      _messages.add({'sender': 'ai', 'text': _generateEmpatheticReply(text)});
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF141414),
        title: const Text('Mai300X • พื้นที่รับฟัง', style: TextStyle(color: Color(0xFFFFB88C))),
        actions: [
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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg['sender'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
                    decoration: BoxDecoration(
                      color: isUser ? const Color(0xFFFFB88C) : const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      msg['text'] ?? '',
                      style: TextStyle(
                        color: isUser ? const Color(0xFF2B1E1A) : Colors.white,
                        fontSize: 15,
                        height: 1.45,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: const Color(0xFF141414),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      maxLines: 3,
                      minLines: 1,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'พิมพ์สิ่งที่หนักใจตรงนี้ได้เลย...',
                        hintStyle: const TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: const Color(0xFF222222),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: const Color(0xFFFFB88C),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Color(0xFF2B1E1A)),
                      onPressed: _sendMessage,
                    ),
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

class EmergencyHelpPage extends StatelessWidget {
  const EmergencyHelpPage({super.key});

  Future<void> _launchAction(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF141414),
        title: const Text('ช่องทางช่วยเหลือเร่งด่วน', style: TextStyle(color: Color(0xFFFFB88C))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'คุณไม่ได้อยู่ตัวคนเดียวบนโลกใบนี้',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFFFB88C)),
            ),
            const SizedBox(height: 10),
            const Text(
              'เราเป็นเพื่อนที่พร้อมรับฟังคุณเสมอ แต่หากตอนนี้ความรู้สึกมันหนักจนเกินรับไหว โปรดติดต่อผู้เชี่ยวชาญที่พร้อมดูแลคุณตลอด 24 ชั่วโมงได้ทันที:',
              style: TextStyle(fontSize: 15, color: Colors.white70, height: 1.5),
            ),
            const SizedBox(height: 24),
            _buildHelpCard(
              title: 'สายด่วนสุขภาพจิต (ประเทศไทย)',
              subtitle: 'โทร 1323 • ฟรีตลอด 24 ชั่วโมง',
              icon: Icons.phone,
              onTap: () => _launchAction('tel:1323'),
            ),
            const SizedBox(height: 12),
            _buildHelpCard(
              title: 'Suicide & Crisis Lifeline (USA)',
              subtitle: 'โทรหรือส่งข้อความ 988 • 24 ชั่วโมง',
              icon: Icons.phone,
              onTap: () => _launchAction('tel:988'),
            ),
            const SizedBox(height: 12),
            _buildHelpCard(
              title: 'สายด่วนช่วยเหลือทั่วโลก (International)',
              subtitle: 'findahelpline.com • ค้นหาความช่วยเหลือในประเทศของคุณ',
              icon: Icons.public,
              onTap: () => _launchAction('https://findahelpline.com'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      color: const Color(0xFF1C1C1C),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFFFB88C),
          child: Icon(icon, color: const Color(0xFF2B1E1A)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFFFFB88C), size: 16),
        onTap: onTap,
      ),
    );
  }
}
