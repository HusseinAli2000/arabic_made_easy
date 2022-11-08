import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'main_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.teal[100],
            content: Text(
              'Password reset link has been sent ! Check your Email',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.teal[800],
                fontFamily: 'Akaya',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.teal[100],
            content: Text(
              e.message.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.teal[800],
                fontFamily: 'Akaya',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                            );
                          },
                        );
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 210, 235, 233)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.teal,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 130,
                ),
                const CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('images/icon.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Enter your Email below to get a reset Password link',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 7, 82, 75),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Akaya',
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      border: Border.all(color: Colors.white70),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      passwordReset();
                    });
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 193, 222, 220),
                    ),
                  ),
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 110, 99),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Akaya',
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
