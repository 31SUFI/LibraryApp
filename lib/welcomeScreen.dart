import 'package:flutter/material.dart';

import 'package:task_management_app/Login.dart';
import 'package:task_management_app/Signup.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 80), // Added space at the top

                // Text (Use a darker shade for better contrast)
                const Text(
                  'Greetings!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .black87, // Use a darker shade for better contrast
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Let\'s have a look.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 40),

                // Star Stack with Image
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.brown[100],
                      ),
                    ),
                    Image.asset(
                      'assets/images/bookfinal.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),

                const SizedBox(height: 60),

                // Sign In Button (Use a contrasting background color)
                Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.teal, // Use a contrasting color
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 11),
                      textStyle:
                          const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    child: const Text('Sign in'),
                  ),
                ),
                const SizedBox(height: 10),

                // Create an Account Button (Use a contrasting background color)
                Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 173, 131, 115), // Use a contrasting color
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 173, 131, 115),
                      shadowColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 12),
                      textStyle:
                          const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    child: const Text('Create an Account'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Need help with logging in?',
                  style: TextStyle(color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
