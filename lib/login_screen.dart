import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgot_password_page.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginScreen({super.key, required this.showRegisterPage});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
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
        body: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('images/icon.png'),
                  ),
                  const Text(
                    'Welcome !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      fontFamily: 'Caveat',
                      color: Color.fromARGB(255, 205, 234, 232),
                    ),
                  ),
                  const Text(
                    'Sign In to acess your Arabic learning',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'Caveat',
                      color: Color.fromARGB(255, 205, 234, 232),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
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
                  const SizedBox(
                    height: 10,
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
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color.fromARGB(255, 7, 82, 75),
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
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: GestureDetector(
                  //     onTap: signIn,
                  //     child: Container(
                  //       padding: const EdgeInsets.all(20),
                  //       decoration: BoxDecoration(
                  //         color: Colors.teal,
                  //         borderRadius: BorderRadius.circular(12),
                  //       ),
                  //       child: const Center(
                  //         child: Text(
                  //           'Sign In',
                  //           style: TextStyle(
                  //             color: Color.fromARGB(255, 205, 234, 232),
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 18,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        signIn,
                      );
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 210, 235, 233)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Sign In',
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
                      ],
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
                          color: Color.fromARGB(255, 205, 234, 232),
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
                            color: Color.fromARGB(255, 7, 82, 75),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Akaya',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
