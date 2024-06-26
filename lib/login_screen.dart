import 'package:arabic_made_easy/auth_service.dart';
import 'package:arabic_made_easy/limited_access_page.dart';
import 'package:arabic_made_easy/second_page.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'forgot_password_page.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  final Function()? onTap;
  const LoginScreen({super.key, required this.showRegisterPage, this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Color.fromARGB(240, 34, 27, 78),
            content: Text(
              "Wrong Email or Password, if you have forgotten your Password click on 'Forgot Password?' to reset your Password",
              style: TextStyle(
                color: Color.fromARGB(255, 235, 234, 243),
                fontFamily: 'Caveat',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/icon4.png',
                      height: 70,
                      width: 70,
                    ),
                    const Text(
                      'Welcome !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Pacifico',
                        color: Color.fromARGB(255, 235, 234, 243),
                      ),
                    ),
                    const Text(
                      'Sign In to acess your Arabic learning',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Pacifico',
                        color: Color.fromARGB(255, 235, 234, 243),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 235, 234, 243),
                          border: Border.all(color: Colors.white70),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: TextField(
                            style: const TextStyle(
                              color: Color.fromARGB(200, 20, 0, 75),
                              fontSize: 20,
                              fontFamily: 'Caveat',
                            ),
                            controller: emailController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(150, 20, 0, 75),
                                fontSize: 20,
                                fontFamily: 'Caveat',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 235, 234, 243),
                          border: Border.all(color: Colors.white70),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: TextField(
                            style: const TextStyle(
                              color: Color.fromARGB(200, 20, 0, 75),
                              fontFamily: 'Caveat',
                              fontSize: 20,
                            ),
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(150, 20, 0, 75),
                                fontSize: 20,
                                fontFamily: 'Caveat',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              AudioPlayer().play(
                                AssetSource('spelling/click.mp3'),
                              );
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordPage(),
                                  ),
                                );
                              });
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Akaya',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
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
                          AudioPlayer().play(
                            AssetSource('spelling/click.mp3'),
                          );
                          Future.delayed(const Duration(milliseconds: 500), () {
                            setState(
                              signIn,
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
                              'Sign In',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Pacifico',
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        AudioPlayer().play(
                          AssetSource('spelling/click.mp3'),
                        );
                        Future.delayed(const Duration(milliseconds: 500), () {
                          AuthService().signInWithGoogle();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 235, 234, 243),
                        ),
                        width: 50,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            'images/google.png',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Not a member? ',
                          style: TextStyle(
                            color: Color.fromARGB(100, 235, 234, 243),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Akaya',
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.showRegisterPage,
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Akaya',
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Or ',
                          style: TextStyle(
                            color: Color.fromARGB(100, 235, 234, 243),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Akaya',
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            AudioPlayer().play(
                              AssetSource('spelling/click.mp3'),
                            );
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const LimitedAccessPage(),
                                  ),
                                );
                              });
                            });
                          },
                          child: const Text(
                            'Continue as a Guest',
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Akaya',
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
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
