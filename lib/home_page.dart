import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';
import 'second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 32, 6, 96),
                  Color.fromARGB(255, 57, 119, 194),
                ],
              ),
            ),
          ),
          title: const Center(
            child: Text(
              'Arabic Made Easy',
              style: TextStyle(
                fontFamily: 'Akaya',
                fontSize: 30,
                color: Color.fromARGB(255, 235, 234, 243),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 125, 173, 232),
                Color.fromARGB(255, 20, 0, 70),
              ],
            ),
          ),
          child: Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/icon4.png',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    'Signed in as: ${user.email!}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 235, 234, 243),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                    width: 250.0,
                    child: Divider(
                      color: Color.fromARGB(255, 235, 234, 243),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 8, 3, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 32, 6, 96),
                            Color.fromARGB(255, 57, 119, 194),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
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
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(130, 35, 61, 155),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            SizedBox(
                              width: 30,
                              height: 50,
                            ),
                            Text(
                              'Get Started',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Pacifico',
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.start,
                              color: Color.fromARGB(255, 235, 234, 243),
                              size: 24.0,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 8, 3, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 32, 6, 96),
                            Color.fromARGB(255, 57, 119, 194),
                          ],
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                            );
                          });
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: Color.fromARGB(255, 235, 234, 243),
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
    );
  }
}
