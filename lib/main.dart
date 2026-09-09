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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF08CDB9),
        ),
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

// ==================== PARTY PAGE ====================

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
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          // Top Banner
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
                  const Positioned(
                    left: 20,
                    top: 62,
                    child: Text(
                      'Meet new friends & enjoy the party',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
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
                  category(
                    Icons.local_fire_department,
                    'Popular',
                  ),
                  category(
                    Icons.star,
                    'Top',
                  ),
                  category(
                    Icons.family_restroom,
                    'Family',
                  ),
                  category(
                    Icons.emoji_events,
                    'Ranking',
                  ),
                  category(
                    Icons.games,
                    'Games',
                  ),
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

          // Rooms
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
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.88,
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}

// ==================== CATEGORY ====================

Widget category(IconData icon, String title) {
  return Container(
    width: 82,
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: const Color(0xFF08CDB9),
            size: 30,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

// ==================== ROOM CARD ====================

class RoomCard extends StatelessWidget {
  final String rank;
  final String name;
  final String users;

  const RoomCard({
    super.key,
    required this.rank,
    required this.name,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD42A),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  rank,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Container(
                height: 82,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF08CDB9),
                      Color(0xFF7B61FF),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.groups,
                  color: Colors.white,
                  size: 42,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 5),

              Row(
                children: [
                  const Icon(
                    Icons.people,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$users online',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== DISCOVER PAGE ====================

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: const Color(0xFF08CDB9),
            title: const Text(
              'Discover',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  discoverItem(
                    Icons.people,
                    'Find Friends',
                    'Meet interesting people',
                  ),
                  discoverItem(
                    Icons.public,
                    'Nearby',
                    'Discover people around you',
                  ),
                  discoverItem(
                    Icons.music_note,
                    'Music',
                    'Listen and party together',
                  ),
                  discoverItem(
                    Icons.sports_esports,
                    'Games',
                    'Play games with friends',
                  ),
                  discoverItem(
                    Icons.emoji_events,
                    'Ranking',
                    'Check the latest ranking',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget discoverItem(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF08CDB9),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}

// ==================== MESSAGE PAGE ====================

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: const Color(0xFF08CDB9),
            title: const Text(
              'Message',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  messageItem(
                    'System',
                    'Welcome to WavyChat!',
                    Icons.notifications,
                  ),
                  messageItem(
                    'WavyChat Team',
                    'Enjoy your party 🎉',
                    Icons.campaign,
                  ),
                  messageItem(
                    'Friends',
                    'You have new friend requests',
                    Icons.people,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget messageItem(
    String title,
    String message,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF08CDB9),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(message),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

// ==================== MY PAGE ====================

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: const Color(0xFF08CDB9),
            title: const Text(
              'My Profile',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 48,
                    backgroundColor: Color(0xFF08CDB9),
                    child: Icon(
                      Icons.person,
                      size: 55,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Wavy User',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'Welcome to WavyChat',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 25),

                  profileItem(
                    Icons.person_outline,
                    'Edit Profile',
                  ),
                  profileItem(
                    Icons.account_balance_wallet_outlined,
                    'Wallet',
                  ),
                  profileItem(
                    Icons.settings_outlined,
                    'Settings',
                  ),
                  profileItem(
                    Icons.help_outline,
                    'Help & Support',
                  ),
                  profileItem(
                    Icons.info_outline,
                    'About WavyChat',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileItem(
    IconData icon,
    String title,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF08CDB9),
        ),
        title: Text(title),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        onTap: () {},
      ),
    );
  }
}
