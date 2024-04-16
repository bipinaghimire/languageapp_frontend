import 'package:flutter/material.dart';
import 'package:languageapp_frontend/config/constants/google_sign_in.dart';
import 'package:languageapp_frontend/config/router/app_routes.dart';

class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Language Dropdown with Country Flags
            Row(
              children: [
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem<String>(
                      value: 'english',
                      child: Row(
                        children: [
                          Image.asset('assets/images/usa.jpg',
                              height: 24, width: 24),
                          const SizedBox(width: 8),
                          const Text(
                            'English',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'nepali',
                      child: Row(
                        children: [
                          Image.asset('assets/images/nepal.png',
                              height: 24, width: 24),
                          const SizedBox(width: 8),
                          const Text(
                            'Nepali',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    // Handle language selection
                  },
                  value: 'english', // Default value
                ),
              ],
            ),
            const Spacer(), // Spacer to center the logo and text vertically
            const Text(
              'LOGO',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Start learning various languages',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'of Nepal for FREE',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 234, 96, 28),
              ),
            ),
            const Spacer(), // Spacer to center the buttons vertically
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, AppRoute.signupRoute);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 234, 96, 28),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Set your desired border radius
                ),
                minimumSize: const Size(
                    double.infinity, 50), // Set the height of the button
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 8),
                  Text(
                    'Sign up free',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => signIn(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Set your desired border radius
                ),
                minimumSize: const Size(
                    double.infinity, 50), // Set the height of the button
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/google.jpg',
                      height: 24, width: 24),
                  const SizedBox(width: 8),
                  const Text(
                    'Continue with Google',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle Continue with Facebook
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Set your desired border radius
                ),
                minimumSize: const Size(
                    double.infinity, 50), // Set the height of the button
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/facebook.png',
                      height: 24, width: 24),
                  const SizedBox(width: 8),
                  const Text(
                    'Continue with Facebook',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextButton(
                onPressed: () {
                  // Handle Log In
                },
                child: const Text(
                  'Already a member?',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, AppRoute.loginRoute);
                },
                child: const Text(
                  'Log In',
                  style: TextStyle(color: Color.fromARGB(255, 234, 96, 28)),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Future<void> signIn(BuildContext context) async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      print('Sign in failed');
    } else {
      print(user);
      print('success');
      Navigator.popAndPushNamed(context, AppRoute.preDashRoute);
    }
  }
}
