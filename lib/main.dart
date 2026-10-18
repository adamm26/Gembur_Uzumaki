import 'package:flutter/material.dart';

void main() {
  runApp(const FootballApp());
}

// ==========================================
// TAHAP 1: MODEL DATA
// ==========================================
class MatchSchedule {
  final String homeTeam;
  final String awayTeam;
  final String matchTime;
  final String league;

  MatchSchedule({
    required this.homeTeam,
    required this.awayTeam,
    required this.matchTime,
    required this.league,
  });
}

class PlayerProfile {
  final String name;
  final String position;
  final String club;
  final int jerseyNumber;
  final String photoUrl;
  final String biography;

  PlayerProfile({
    required this.name,
    required this.position,
    required this.club,
    required this.jerseyNumber,
    required this.photoUrl,
    required this.biography,
  });
}

// ==========================================
// TAHAP 2: APLIKASI UTAMA & TAMPILAN UTAMA
// ==========================================
class FootballApp extends StatelessWidget {
  const FootballApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bola Info App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF10B981),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<MatchSchedule> get dummyMatches => [
    MatchSchedule(
      homeTeam: 'Real Madrid',
      awayTeam: 'Barcelona',
      matchTime: '23:00 - Sabtu',
      league: 'El Clásico - La Liga',
    ),
    MatchSchedule(
      homeTeam: 'Man City',
      awayTeam: 'Arsenal',
      matchTime: '02:00 - Minggu',
      league: 'Premier League',
    ),
  ];

  List<PlayerProfile> get dummyPlayers => [
    PlayerProfile(
      name: 'Cristiano Ronaldo🐐',
      position: 'Striker',
      club: 'Al Nassr',
      jerseyNumber: 7,
      photoUrl: 'assets/Goat.jpg',
      biography: 'Cristiano Ronaldo the best player at Al Nassr.',
    ),
    PlayerProfile(
      name: 'Jude Bellingham',
      position: 'Gelandang',
      club: 'Real Madrid',
      jerseyNumber: 5,
      photoUrl: 'assets/Bellingham.jpg',
      biography: 'Jude Victor William Bellingham Real Madrid.',
    ),
    PlayerProfile(
      name: 'Lamine Yamal',
      position: 'Penyerang',
      club: 'Barcelona',
      jerseyNumber: 19,
      photoUrl: 'assets/yamal.jpg',
      biography: 'Lamine Yamal Nasraoui Ebana Barcelona.',
    ),
    PlayerProfile(
      name: 'Erling Haaland',
      position: 'Striker',
      club: 'Man City',
      jerseyNumber: 9,
      photoUrl: 'assets/Haaland.jpg',
      biography: 'Erling Braut Haaland Manchester City.',
    ),
    PlayerProfile(
      name: 'Kevin De Bruyne',
      position: 'gelandang',
      club: 'Manchaster City',
      jerseyNumber: 17,
      photoUrl: 'assets/kdb_napoli.jpg',
      biography: 'Kevin De Bruyne Player Napoli'
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '⚽ Bola Info',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jadwal Pertandingan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dummyMatches.length,
              itemBuilder: (context, index) {
                final match = dummyMatches[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        match.league,
                        style: const TextStyle(
                          color: Color(0xFF10B981),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Text(
                              match.homeTeam,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF334155),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              match.matchTime,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              match.awayTeam,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            const Text(
              'Pemain Populer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyPlayers.length,
                itemBuilder: (context, index) {
                  final player = dummyPlayers[index];
                  // TAHAP 3: Menggunakan GestureDetector agar kartu pemain bisa diklik
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlayerDetailScreen(player: player),
                        ),
                      );
                    },
                    child: Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // KODE PERBAIKAN agar muncul FOTO
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: const Color(0xFF334155),
                            backgroundImage: player.photoUrl.startsWith('assets/')
                                ? AssetImage(player.photoUrl) as ImageProvider
                                : NetworkImage(player.photoUrl),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            player.name,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            player.club,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TAHAP 3: HALAMAN DETAIL PROFIL PEMAIN
// ==========================================
class PlayerDetailScreen extends StatelessWidget {
  final PlayerProfile player;

  const PlayerDetailScreen({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(player.name),
        backgroundColor: const Color(0xFF1E293B),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: const Color(0xFF1E293B),
              backgroundImage: player.photoUrl.startsWith('assets/')
                  ? AssetImage(player.photoUrl) as ImageProvider
                  : NetworkImage(player.photoUrl),
            ),
            const SizedBox(height: 16),
            Text(
              player.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${player.position} • ${player.club}', // Diperbaiki agar tidak terpotong
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF10B981),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Biografi Singkat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    player.biography,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}