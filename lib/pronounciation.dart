import 'package:flutter/material.dart';
import 'home_page.dart';
import 'second_page.dart';

class Pronounciation extends StatelessWidget {
  const Pronounciation({super.key});

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
        body: const PronounciationStful(),
      ),
    );
  }
}

class PronounciationStful extends StatefulWidget {
  const PronounciationStful({super.key});

  @override
  State<PronounciationStful> createState() => _PronounciationStfulState();
}

class _PronounciationStfulState extends State<PronounciationStful> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageTwo(),
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
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
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
                    Icons.home,
                    color: Colors.teal,
                    size: 24.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
