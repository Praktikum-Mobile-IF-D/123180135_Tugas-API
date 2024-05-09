import 'package:flutter/material.dart';
import 'login_page.dart';

class HalamanProfilAbhy extends StatefulWidget {
  const HalamanProfilAbhy({Key? key}) : super(key: key);

  @override
  State<HalamanProfilAbhy> createState() => _HalamanProfilAbhyState();
}

class _HalamanProfilAbhyState extends State<HalamanProfilAbhy> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('DataDiri'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: colorScheme.surface,
        selectedItemColor: Colors.blue,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          if (value == 1) {
            AlertDialog alert = AlertDialog(
              title: const Text("Logout"),
              content: Container(
                child: const Text("Apakah Anda Yakin Ingin Logout?"),
              ),
              actions: [
                TextButton(
                  child: const Text("Yes"),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                ),
                TextButton(
                  child: const Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
            showDialog(context: context, builder: (context) => alert);
          }
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Halaman Utama',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Logout',
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage (
                    'images/abhy.png'
                ),
                radius: 80,
              ),
              SizedBox(height: 16),
              Text(
                'PRAMANA ABHYASA WICAKSANA',
                style: TextStyle (
                    fontSize: 20, fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8),
              Text(
                '123180135',
                style: TextStyle (
                    fontSize: 16
                ),
              ),
              SizedBox(height: 24),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text('View Profile Details'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text('Nama'),
                      subtitle: Text('Pramana Abhyasa Wicaksana'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.school),
                      title: Text('Kelas'),
                      subtitle: Text('Praktikum Teknologi Dan Pemrograman Mobile IF-D'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('Hobby'),
                      subtitle: Text('Belajar dan berdoa'),
                    ),
                    Divider(),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}