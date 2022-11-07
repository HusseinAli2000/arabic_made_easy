import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Arabic Made Easy',
              style: TextStyle(
                fontFamily: 'Akaya',
                fontSize: 30,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.teal[100],
        ),
        backgroundColor: Colors.teal[300],
        body: const HomePageStful(),
      ),
    );
  }
}

class HomePageStful extends StatefulWidget {
  const HomePageStful({super.key});

  @override
  State<HomePageStful> createState() => _HomePageStfulState();
}

class _HomePageStfulState extends State<HomePageStful> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/icon.png'),
          ),
          Container(),
          const Text(
            'Login Sucessful',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 25.0,
              color: Color.fromARGB(255, 199, 233, 230),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20.0,
            width: 200.0,
            child: Divider(
              color: Color.fromARGB(255, 154, 214, 209),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PageTwo(),
                  ),
                );
              });
            },
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 210, 235, 233)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.teal,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.start,
                  color: Colors.teal,
                  size: 24.0,
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.teal,
            child: Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
