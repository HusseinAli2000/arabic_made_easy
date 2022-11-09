import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    }
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
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color.fromARGB(0, 95, 123, 215),
                      radius: 40.0,
                      backgroundImage: AssetImage('images/icon4.png'),
                    ),
                    const Text(
                      'Sign Up Below:',
                      style: TextStyle(
                        fontSize: 25,
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
                              fontSize: 20,
                              fontFamily: 'Caveat',
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
                            controller: confirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm Password',
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
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: GestureDetector(
                    //     onTap: signUp,
                    //     child: Container(
                    //       padding: const EdgeInsets.all(20),
                    //       decoration: BoxDecoration(
                    //         color: Colors.teal,
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       child: const Center(
                    //         child: Text(
                    //           'Sign Up',
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
                          signUp,
                        );
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(130, 79, 64, 179),
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
                            'Sign Up',
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Are you a member? ',
                          style: TextStyle(
                            color: Color.fromARGB(100, 235, 234, 243),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Akaya',
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.showLoginPage,
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
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
      ),
    );
  }
}
