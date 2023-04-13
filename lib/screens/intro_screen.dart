import 'package:flutter/material.dart';
import 'homepage_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Image.asset('lib/assets/apple.jpg'),
          ),
          // we deliver groceries at your doorstep
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'We deliver groceries at your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.montaga(fontSize: 36),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // fresh items everyday
          Text(
            'Fresh items everyday',
            style: TextStyle(color: Colors.grey[600]),
          ),

          const Spacer(),

          // get started
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomepageScreen())),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Get started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
