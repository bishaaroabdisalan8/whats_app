import 'package:flutter/material.dart';

void main() {
  runApp(const UniversityWhatsApp());
}

class UniversityWhatsApp extends StatelessWidget {
  const UniversityWhatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({super.key});

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> {
  final TextEditingController searchController = TextEditingController();

  final List<String> categories = [
    'All',
    'Unread  7',
    'Favorites',
    'Groups  3',
    'University',
  ];

  int selectedCategory = 4;

  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Mohammed Abdul',
      'message': 'Asc . Mr Abdul .How are you? I hope you are...',
      'time': '09:04',
      'avatar': 'M',
      'color': Colors.green,
      'read': true,
    },
    {
      'name': 'EAU:SEM 4',
      'message': 'nus ay mo abdirisak: Fluid, Electrolyte, and...',
      'time': 'Yesterday',
      'avatar': 'EAU',
      'color': Colors.blue,
      'read': false,
    },
    {
      'name': 'Computer Science Sem 7 (JBA) G...',
      'message': 'Tom: Ethical Theories Computer Ethi...',
      'time': '10/26/26',
      'avatar': 'CS',
      'color': Colors.blueAccent,
      'read': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1014),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              child: Row(
                children: [
                  const Text(
                    'WhatsApp',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_outlined, size: 30),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert, size: 30),
                  ),
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: TextField(
                controller: searchController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search University',
                  hintStyle: const TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 32,
                    color: Colors.white54,
                  ),
                  filled: true,
                  fillColor: const Color(0xFF24292D),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Categories
            SizedBox(
              height: 65,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final selected = selectedCategory == index;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ChoiceChip(
                      label: Text(categories[index]),
                      selected: selected,
                      onSelected: (value) {
                        setState(() {
                          selectedCategory = index;
                        });
                      },
                      backgroundColor: Colors.transparent,
                      selectedColor: const Color(0xFF064E3B),
                      side: BorderSide(
                        color: selected
                            ? Colors.green.shade900
                            : Colors.white24,
                      ),
                      labelStyle: TextStyle(
                        color: selected
                            ? Colors.greenAccent.shade100
                            : Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Chat list
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];

                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 25,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 34,
                            backgroundColor: chat['color'],
                            child: Text(
                              chat['avatar'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(width: 22),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chat['name'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                const SizedBox(height: 9),

                                Row(
                                  children: [
                                    if (chat['read'])
                                      const Icon(
                                        Icons.done_all,
                                        color: Colors.white54,
                                        size: 20,
                                      ),

                                    if (chat['read']) const SizedBox(width: 5),

                                    Expanded(
                                      child: Text(
                                        chat['message'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white54,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 10),

                          Text(
                            chat['time'],
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Manage University
            Container(
              width: double.infinity,
              height: 90,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.white12)),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Manage University',
                    style: TextStyle(
                      color: Color(0xFF25D366),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Floating buttons
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'assistant',
            mini: true,
            backgroundColor: const Color(0xFF24292D),
            onPressed: () {},
            child: const Icon(
              Icons.auto_awesome,
              color: Colors.purpleAccent,
              size: 28,
            ),
          ),

          const SizedBox(height: 25),

          FloatingActionButton(
            heroTag: 'newchat',
            backgroundColor: const Color(0xFF20C66B),
            onPressed: () {},
            child: const Icon(Icons.add_box, color: Colors.black, size: 30),
          ),
        ],
      ),
    );
  }
}