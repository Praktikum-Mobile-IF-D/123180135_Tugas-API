import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:revisi_film/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Importing AssetManifest from flutter/services.dart
import 'package:revisi_film/view/login_page.dart';
import 'package:revisi_film/view/profile.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'page_list_film.dart';

class PageSearchFilm extends StatefulWidget {
  const PageSearchFilm({Key? key}) : super(key: key);

  @override
  _PageSearchFilmState createState() => _PageSearchFilmState();
}

class _PageSearchFilmState extends State<PageSearchFilm> {
  //shared preferences
  late SharedPreferences logindata;
  late String username;
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  final _controller = TextEditingController();
  String? text;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Film"),
        // backgroundColor: Colors.blue,
        // foregroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: colorScheme.surface,
        selectedItemColor: Colors.blue,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        // selectedLabelStyle: textTheme.caption,
        // unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          if (value == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HalamanProfilAbhy()));
          } else if (value == 2) {
            AlertDialog alert = AlertDialog(
              title: const Text("Logout"),
              content: const Text("Yakin Logout?"),
              actions: [
                TextButton(
                  child: const Text("Yes"),
                  onPressed: () {
                    ////Tanpa shared preferences
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginPage()),
                    // );
                    ////Shared Preferences
                    logindata.setBool('login', true);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage()));
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
            ;
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
            label: 'Profile',
            icon: Icon(Icons.account_circle_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Logout',
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(1),
              child: Container(
                child: TextField(
                  selectionHeightStyle: BoxHeightStyle.max,
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'NunitoSans', // Specify the font family
                      color: Colors.black),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'NunitoSans', // Specify the font family
                    ),
                    hintText: "Enter film title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    filled: true,
                    icon: const Icon(
                      Icons.search,
                      size: 40.0,
                    ),
                  ),
                  controller: _controller,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.all(1),
            child: ElevatedButton(
              child: const Text(
                "Search",
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PageListFilms(text: _controller.text);
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}
