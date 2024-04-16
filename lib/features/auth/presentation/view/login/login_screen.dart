// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:languageapp_frontend/features/auth/data/model/argument.dart';
import 'package:languageapp_frontend/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:local_auth/local_auth.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isObscured = true;
  Color _buttonColor = const Color.fromARGB(255, 240, 134, 81); // Initial color

  String? usernameError; // Add this line to declare usernameError
  String? passwordError;

  LocalAuthentication auth = LocalAuthentication();

  ScreenArguments args = ScreenArguments();
  String? authorized;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ScreenArguments? arguments =
        ModalRoute.of(context)?.settings.arguments as ScreenArguments?;
    if (arguments != null) {
      args = arguments;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.read(authViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, '/login_signup');
          },
        ),
        // automaticallyImplyLeading: true,
      ),
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(
                              10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black),
                            ),
                            child: TextField(
                              controller: passwordController,
                              obscureText:
                                  _isObscured, // Use obscureText property
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(_isObscured
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle the "Forgot password?" button press
                              // For example, you can navigate to the forgot password screen
                            },
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Color.fromARGB(255, 234, 96, 28),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final email = emailController.text;
                            final password = passwordController.text;
                            await authViewModel.loginUser(
                                context, email, password);
                          }

                          emailController.clear();
                          passwordController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _buttonColor,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateButtonColor() {
    setState(() {
      _buttonColor = (emailController.text.isNotEmpty &&
              passwordController.text.isNotEmpty)
          ? const Color.fromARGB(255, 234, 96, 28) // Non-empty color
          : const Color.fromARGB(255, 240, 134, 81); // Empty color
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
