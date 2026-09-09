import 'package:flutter/material.dart';

void main() {
  runApp(const WavyChatApp());
}

class WavyChatApp extends StatelessWidget {
  const WavyChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WavyChat',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFE9FFFA),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    PartyPage(),
    DiscoverPage(),
    MessagePage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: const Color(0xFF08CDB9),
        indicatorColor: const Color(0xFFFFD42A),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Party',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Discover',
          ),
          NavigationDestination(
            icon: Icon(Icons.campaign_outlined),
            selectedIcon: Icon(Icons.campaign),
            label: 'Message',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'My',
          ),
        ],
      ),
    );
  }
}

class PartyPage extends StatelessWidget {
  const PartyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: const Color(0xFF08CDB9),
            title: const Text(
              'WavyChat',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none,
                    color: Colors.white),
              ),
            ],
          ),

          // Top banner
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(12),
              height: 155,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFB78AFF),
                    Color(0xFFF4A7E8),
                    Color(0xFFFFD1EA),
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    left: 20,
                    top: 22,
                    child: Text(
                      'Eternal Promise',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 18,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Join Now'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Categories
          SliverToBoxAdapter(
            child: SizedBox(
              height: 105,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  category(Icons.local_fire_department, 'Popular'),
                  category(Icons.star, 'Top'),
                  category(Icons.family_restroom, 'Family'),
                  category(Icons.emoji_events, 'Ranking'),
                  category(Icons.games, 'Games'),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Text(
                'Popular Rooms',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final rooms = [
                    ['TOP 1', 'Golden Family', '2.1K'],
                    ['TOP 2', 'Friends Room', '1.5K'],
                    ['TOP 3', 'Voice Party', '980'],
                    ['TOP 4', 'Bangladesh Room', '760'],
                    ['TOP 5', 'Music Lounge', '530'],
                    ['TOP 6', 'Game Center', '420'],
                  ];

                  return RoomCard(
                    rank: rooms[index][0],
                    name: rooms[index][1],
                    users: rooms[index][2],
                  );
                },
                childCount: 6,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.88,
             
