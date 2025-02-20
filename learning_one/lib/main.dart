import 'package:flutter/material.dart';
import 'package:learning_one/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto Condensed"
      ),
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          elevation: 5.0,
          title: Text(
            "My App",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          leading: Icon(Icons.menu),
          actions: [
            IconButton(
                onPressed: () {
                  print('login on App bar');
                },
                icon: Icon(Icons.login_sharp))
          ],
        ),
        body: LoginPage(),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.blue[100],
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile")
          ],
        ),
      ),
    );
  }
}
