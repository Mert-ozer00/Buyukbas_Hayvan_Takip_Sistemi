// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const LivestockManagementApp());
}

class LivestockManagementApp extends StatelessWidget {
  const LivestockManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Büyükbaş Yönetim',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

// Models
class User {
  final String id;
  final String name;
  final String type;

  User({required this.id, required this.name, required this.type});
}

class Animal {
  final int id;
  final String kulakNo;
  final String tur;
  final int yas;
  final String cinsiyet;
  final String durum;
  final String sahipId;

  Animal({
    required this.id,
    required this.kulakNo,
    required this.tur,
    required this.yas,
    required this.cinsiyet,
    required this.durum,
    required this.sahipId,
  });
}

class Vaccination {
  final int id;
  final int hayvanId;
  final String asiAdi;
  final String tarih;
  final String sonrakiTarih;
  final String veterinerId;

  Vaccination({
    required this.id,
    required this.hayvanId,
    required this.asiAdi,
    required this.tarih,
    required this.sonrakiTarih,
    required this.veterinerId,
  });
}

class AnimalEvent {
  final int id;
  final int hayvanId;
  final String tip;
  final String tarih;
  final String notlar;
  final String kaydedenId;

  AnimalEvent({
    required this.id,
    required this.hayvanId,
    required this.tip,
    required this.tarih,
    required this.notlar,
    required this.kaydedenId,
  });
}

// Login Screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String loginType = 'farmer';
  final TextEditingController usernameController = TextEditingController();

  void handleLogin() {
    if (usernameController.text.trim().isNotEmpty) {
      final user = User(
        id: loginType == 'farmer' ? 'farmer1' : 'vet1',
        name: usernameController.text,
        type: loginType,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen(user: user)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE8F5E9), Color(0xFFE3F2FD)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 48,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Büyükbaş Yönetim',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Hayvan Takip Sistemi',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Kullanıcı Tipi',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => loginType = 'farmer'),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: loginType == 'farmer'
                                    ? Colors.green.shade50
                                    : Colors.white,
                                border: Border.all(
                                  color: loginType == 'farmer'
                                      ? Colors.green
                                      : Colors.grey.shade300,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Hayvancı',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: loginType == 'farmer'
                                          ? Colors.green
                                          : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Çiftlik Sahibi',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => loginType = 'vet'),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: loginType == 'vet'
                                    ? Colors.blue.shade50
                                    : Colors.white,
                                border: Border.all(
                                  color: loginType == 'vet'
                                      ? Colors.blue
                                      : Colors.grey.shade300,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Veteriner',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: loginType == 'vet'
                                          ? Colors.blue
                                          : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Aşı Takibi',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Kullanıcı Adı',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: 'Adınızı girin',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Giriş Yap',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Main Screen with Bottom Navigation
class MainScreen extends StatefulWidget {
  final User user;

  const MainScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  
  // Sample data
  List<Animal> animals = [
    Animal(
      id: 1,
      kulakNo: '001TR',
      tur: 'Sığır',
      yas: 3,
      cinsiyet: 'Dişi',
      durum: 'Sağlıklı',
      sahipId: 'farmer1',
    ),
    Animal(
      id: 2,
      kulakNo: '002TR',
      tur: 'Buffalo',
      yas: 5,
      cinsiyet: 'Erkek',
      durum: 'Sağlıklı',
      sahipId: 'farmer1',
    ),
  ];

  List<Vaccination> vaccinations = [
    Vaccination(
      id: 1,
      hayvanId: 1,
      asiAdi: 'Şap',
      tarih: '2024-09-15',
      sonrakiTarih: '2025-03-15',
      veterinerId: 'vet1',
    ),
    Vaccination(
      id: 2,
      hayvanId: 2,
      asiAdi: 'Brusella',
      tarih: '2024-08-20',
      sonrakiTarih: '2025-02-20',
      veterinerId: 'vet1',
    ),
  ];

  List<AnimalEvent> events = [
    AnimalEvent(
      id: 1,
      hayvanId: 1,
      tip: 'Doğum',
      tarih: '2024-10-01',
      notlar: 'Sağlıklı doğum',
      kaydedenId: 'farmer1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screens = [
      DashboardScreen(
        user: widget.user,
        animals: animals,
        vaccinations: vaccinations,
        events: events,
      ),
      AnimalListScreen(
        user: widget.user,
        animals: animals,
        onAnimalAdded: (animal) {
          setState(() {
            animals.add(animal);
          });
        },
      ),
      VaccinationListScreen(
        user: widget.user,
        animals: animals,
        vaccinations: vaccinations,
        onVaccinationAdded: (vaccination) {
          setState(() {
            vaccinations.add(vaccination);
          });
        },
      ),
      EventListScreen(
        user: widget.user,
        animals: animals,
        events: events,
        onEventAdded: (event) {
          setState(() {
            events.add(event);
          });
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4CAF50), Color(0xFF2196F3)],
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Büyükbaş Yönetim',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              '${widget.user.name} (${widget.user.type == 'farmer' ? 'Hayvancı' : 'Veteriner'})',
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Panel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Hayvanlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'Aşılar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Kayıtlar',
          ),
        ],
      ),
    );
  }
}

// Dashboard Screen
class DashboardScreen extends StatelessWidget {
  final User user;
  final List<Animal> animals;
  final List<Vaccination> vaccinations;
  final List<AnimalEvent> events;

  const DashboardScreen({
    Key? key,
    required this.user,
    required this.animals,
    required this.vaccinations,
    required this.events,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userAnimals = user.type == 'farmer'
        ? animals.where((a) => a.sahipId == user.id).toList()
        : animals;

    final sigirSayisi = userAnimals.where((a) => a.tur == 'Sığır').length;
    final bufaloSayisi = userAnimals.where((a) => a.tur == 'Buffalo').length;
    final dogumSayisi = events.where((e) => e.tip == 'Doğum').length;
    final olumSayisi = events.where((e) => e.tip == 'Ölüm').length;

    final upcomingVaccinations = vaccinations.where((v) {
      final nextDate = DateTime.parse(v.sonrakiTarih);
      final today = DateTime.now();
      final difference = nextDate.difference(today).inDays;
      return difference <= 30 && difference > 0;
    }).length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              _buildStatCard(
                'Sığır',
                sigirSayisi.toString(),
                Colors.green,
                Icons.pets,
              ),
              _buildStatCard(
                'Buffalo',
                bufaloSayisi.toString(),
                Colors.blue,
                Icons.pets,
              ),
              _buildStatCard(
                'Doğum',
                dogumSayisi.toString(),
                Colors.purple,
                Icons.child_care,
              ),
              _buildStatCard(
                'Ölüm',
                olumSayisi.toString(),
                Colors.red,
                Icons.warning,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.yellow.shade50,
              border: Border(
                left: BorderSide(color: Colors.yellow.shade700, width: 4),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.warning_amber, color: Colors.yellow.shade700),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Yaklaşan Aşılar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow.shade900,
                        ),
                      ),
                      Text(
                        '$upcomingVaccinations aşı 30 gün içinde yapılacak',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.yellow.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color, color.withOpacity(0.7)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Animal List Screen
class AnimalListScreen extends StatelessWidget {
  final User user;
  final List<Animal> animals;
  final Function(Animal) onAnimalAdded;

  const AnimalListScreen({
    Key? key,
    required this.user,
    required this.animals,
    required this.onAnimalAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userAnimals = user.type == 'farmer'
        ? animals.where((a) => a.sahipId == user.id).toList()
        : animals;

    return Column(
      children: [
        if (user.type == 'farmer')
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _showAddAnimalDialog(context),
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  'Yeni Hayvan Ekle',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: userAnimals.length,
            itemBuilder: (context, index) {
              final animal = userAnimals[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                animal.kulakNo,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${animal.tur} - ${animal.cinsiyet}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: animal.durum == 'Sağlıklı'
                                  ? Colors.green.shade100
                                  : Colors.red.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              animal.durum,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: animal.durum == 'Sağlıklı'
                                    ? Colors.green.shade700
                                    : Colors.red.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Yaş: ${animal.yas} yıl',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
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
    );
  }

  void _showAddAnimalDialog(BuildContext context) {
    final kulakNoController = TextEditingController();
    final yasController = TextEditingController();
    String selectedTur = 'Sığır';
    String selectedCinsiyet = 'Dişi';

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Yeni Hayvan Ekle'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: kulakNoController,
                  decoration: const InputDecoration(
                    labelText: 'Kulak No',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedTur,
                  decoration: const InputDecoration(
                    labelText: 'Tür',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Sığır', 'Buffalo']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) => setState(() => selectedTur = value!),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: yasController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Yaş',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedCinsiyet,
                  decoration: const InputDecoration(
                    labelText: 'Cinsiyet',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Dişi', 'Erkek']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) =>
                      setState(() => selectedCinsiyet = value!),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('İptal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (kulakNoController.text.isNotEmpty &&
                    yasController.text.isNotEmpty) {
                  final newAnimal = Animal(
                    id: animals.length + 1,
                    kulakNo: kulakNoController.text,
                    tur: selectedTur,
                    yas: int.parse(yasController.text),
                    cinsiyet: selectedCinsiyet,
                    durum: 'Sağlıklı',
                    sahipId: user.id,
                  );
                  onAnimalAdded(newAnimal);
                  Navigator.pop(context);
                }
              },
              child: const Text('Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}

// Vaccination List Screen
class VaccinationListScreen extends StatelessWidget {
  final User user;
  final List<Animal> animals;
  final List<Vaccination> vaccinations;
  final Function(Vaccination) onVaccinationAdded;

  const VaccinationListScreen({
    Key? key,
    required this.user,
    required this.animals,
    required this.vaccinations,
    required this.onVaccinationAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final relevantVaccinations = user.type == 'farmer'
        ? vaccinations.where((v) {
            return animals.any((a) => a.id == v.hayvanId && a.sahipId == user.id);
          }).toList()
        : vaccinations;

    return Column(
      children: [
        if (user.type == 'vet')
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _showAddVaccinationDialog(context),
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  'Yeni Aşı Kaydı',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: relevantVaccinations.length,
            itemBuilder: (context, index) {
              final vac = relevantVaccinations[index];
              final animal = animals.firstWhere((a) => a.id == vac.hayvanId);
              
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vac.asiAdi,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Hayvan: ${animal.kulakNo}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.medication, color: Colors.blue),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Yapıldı: ${vac.tarih}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        'Sonraki: ${vac.sonrakiTarih}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
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
    );
  }

  void _showAddVaccinationDialog(BuildContext context) {
    final asiAdiController = TextEditingController();
    int? selectedHayvanId;
    DateTime selectedTarih = DateTime.now();
    DateTime selectedSonrakiTarih = DateTime.now().add(const Duration(days: 180));

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Yeni Aşı Kaydı'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<int>(
                  value: selectedHayvanId,
                  decoration: const InputDecoration(
                    labelText: 'Hayvan Seçin',
                    border: OutlineInputBorder(),
                  ),
                  items: animals
                      .map((a) => DropdownMenuItem(
                            value: a.id,
                            child: Text('${a.kulakNo} - ${a.tur}'),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => selectedHayvanId = value),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: asiAdiController,
                  decoration: const InputDecoration(
                    labelText: 'Aşı Adı',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: const Text('Yapıldığı Tarih'),
                  subtitle: Text(
                    '${selectedTarih.day}/${selectedTarih.month}/${selectedTarih.year}',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: selectedTarih,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      setState(() => selectedTarih = date);
                    }
                  },
                ),
                ListTile(
                  title: const Text('Sonraki Tarih'),
                  subtitle: Text(
                    '${selectedSonrakiTarih.day}/${selectedSonrakiTarih.month}/${selectedSonrakiTarih.year}',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: selectedSonrakiTarih,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      setState(() => selectedSonrakiTarih = date);
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('İptal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedHayvanId != null && asiAdiController.text.isNotEmpty) {
                  final newVaccination = Vaccination(
                    id: vaccinations.length + 1,
                    hayvanId: selectedHayvanId!,
                    asiAdi: asiAdiController.text,
                    tarih: '${selectedTarih.year}-${selectedTarih.month.toString().padLeft(2, '0')}-${selectedTarih.day.toString().padLeft(2, '0')}',
                    sonrakiTarih: '${selectedSonrakiTarih.year}-${selectedSonrakiTarih.month.toString().padLeft(2, '0')}-${selectedSonrakiTarih.day.toString().padLeft(2, '0')}',
                    veterinerId: user.id,
                  );
                  onVaccinationAdded(newVaccination);
                  Navigator.pop(context);
                }
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}

// Event List Screen
class EventListScreen extends StatelessWidget {
  final User user;
  final List<Animal> animals;
  final List<AnimalEvent> events;
  final Function(AnimalEvent) onEventAdded;

  const EventListScreen({
    Key? key,
    required this.user,
    required this.animals,
    required this.events,
    required this.onEventAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final relevantEvents = user.type == 'farmer'
        ? events.where((e) {
            return animals.any((a) => a.id == e.hayvanId && a.sahipId == user.id);
          }).toList()
        : events;

    return Column(
      children: [
        if (user.type == 'farmer')
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _showAddEventDialog(context),
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  'Yeni Kayıt Ekle',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: relevantEvents.length,
            itemBuilder: (context, index) {
              final event = relevantEvents[index];
              final animal = animals.firstWhere((a) => a.id == event.hayvanId);
              
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: event.tip == 'Doğum'
                                  ? Colors.green.shade100
                                  : Colors.red.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              event.tip,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: event.tip == 'Doğum'
                                    ? Colors.green.shade700
                                    : Colors.red.shade700,
                              ),
                            ),
                          ),
                          const Icon(Icons.event, color: Colors.grey),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Hayvan: ${animal.kulakNo}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        'Tarih: ${event.tarih}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      if (event.notlar.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          event.notlar,
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showAddEventDialog(BuildContext context) {
    final notlarController = TextEditingController();
    int? selectedHayvanId;
    String selectedTip = 'Doğum';
    DateTime selectedTarih = DateTime.now();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Yeni Kayıt Ekle'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<int>(
                  value: selectedHayvanId,
                  decoration: const InputDecoration(
                    labelText: 'Hayvan Seçin',
                    border: OutlineInputBorder(),
                  ),
                  items: animals
                      .where((a) => a.sahipId == user.id)
                      .map((a) => DropdownMenuItem(
                            value: a.id,
                            child: Text('${a.kulakNo} - ${a.tur}'),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => selectedHayvanId = value),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedTip,
                  decoration: const InputDecoration(
                    labelText: 'Kayıt Tipi',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Doğum', 'Ölüm']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) => setState(() => selectedTip = value!),
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: const Text('Tarih'),
                  subtitle: Text(
                    '${selectedTarih.day}/${selectedTarih.month}/${selectedTarih.year}',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: selectedTarih,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      setState(() => selectedTarih = date);
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: notlarController,
                  decoration: const InputDecoration(
                    labelText: 'Notlar',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('İptal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedHayvanId != null) {
                  final newEvent = AnimalEvent(
                    id: events.length + 1,
                    hayvanId: selectedHayvanId!,
                    tip: selectedTip,
                    tarih: '${selectedTarih.year}-${selectedTarih.month.toString().padLeft(2, '0')}-${selectedTarih.day.toString().padLeft(2, '0')}',
                    notlar: notlarController.text,
                    kaydedenId: user.id,
                  );
                  onEventAdded(newEvent);
                  Navigator.pop(context);
                }
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
