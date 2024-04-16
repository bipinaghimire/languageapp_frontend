// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ForgotPasswordScreen extends ConsumerStatefulWidget {
//   const ForgotPasswordScreen({Key? key}) : super(key: key);

//   @override
//   _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
//   final passwordController = TextEditingController();
//   String? passwordError;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Forgot Password'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const Text(
//               'Please enter your email address',
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 16),
//             // CustomTextField(
//             //   controller: passwordController,
//             //   labelText: "Password",
//             //   hintText: "Enter your password",
//             //   errorText: passwordError,
//             // ),
//             const SizedBox(height: 20),
//             CustomButton(
//               text: "Reset Password",
//               onPressed: () {
//                 if (passwordController.text.isEmpty) {
//                   setState(() {
//                     passwordError = "Please fill out this option.";
//                   });
//                 } else {
//                   // Reset the error
//                   setState(() {
//                     passwordError = null;
//                   });

//                   // Show SnackBar
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Email has been sent to your email.'),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
