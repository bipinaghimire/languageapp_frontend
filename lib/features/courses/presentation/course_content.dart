import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:languageapp_frontend/config/router/app_routes.dart';

class CourseDetailScreen extends ConsumerStatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends ConsumerState<CourseDetailScreen> {
  int _currentIndex = 0;

  final List<String> _imagePaths = [
    'assets/images/namaste.png',
    'assets/images/byebye.png',
    'assets/images/ghar.png',
    'assets/images/go.png',
  ];

  final List<String> _texts = [
    'Greetings',
    'Bye-Bye',
    'Home',
    'Go',
  ];

  final List<String> _correctAnswers = [
    'Namaste',
    'Ta ta',
    'Ghar',
    'Jau',
  ];

  void _loadNextImageAndText() {
    if (_currentIndex < _imagePaths.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      // Navigate to the next page
      Navigator.pushNamed(context, AppRoute.courseTest);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      return (await showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Go Back?',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        const Text(
                          'If you go back, you will loose all your progress. Are you sure you want to go back',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.red),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            // Navigate to the next screen
                            Navigator.pop(context);
                            // print('clicked');
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 138, 80),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              border: Border.all(
                                color: const Color.fromARGB(255, 241, 92, 18),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 241, 108, 42),
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'No',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            // Navigate to the next screen
                            Navigator.pushNamed(
                                context, AppRoute.bottomNavigations);
                            // print('clicked');
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              border: Border.all(
                                color: const Color.fromARGB(255, 53, 53, 53),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'Yes, Go back',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })) ??
          false;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lesson 1.3'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              onWillPop(); // Show the popup when the back button is pressed
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Your existing content
              // Assuming your progress bar and other content are here

              // Display the image and text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'New word! Tap to select',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    _imagePaths[_currentIndex],
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _texts[_currentIndex],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(
                        color: const Color.fromARGB(255, 125, 125, 125),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 213, 213, 213),
                          offset: Offset(0, 7),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        _correctAnswers[_currentIndex],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 209, 222,
                        226), // Change the background color as needed
                    radius: 25, // Adjust the radius as needed
                    child: Icon(
                      Icons.volume_up,
                      size: 30,
                      color: Color.fromARGB(255, 53, 97, 229),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),

              // Continue button
              GestureDetector(
                onTap: _loadNextImageAndText,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 138, 80),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(
                      color: const Color.fromARGB(255, 241, 92, 18),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 241, 108, 42),
                        offset: Offset(0, 7),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      _currentIndex < _imagePaths.length - 1
                          ? 'Continue'
                          : 'Finish',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:languageapp_frontend/config/router/app_routes.dart';

// class CourseDetailScreen extends ConsumerStatefulWidget {
//   const CourseDetailScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _CourseDetailScreenState();
// }

// class _CourseDetailScreenState extends ConsumerState<CourseDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Lesson 1.2'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 SizedBox(
//                   height: 20, // Adjust height for thicker line
//                   child: ClipRRect(
//                     borderRadius:
//                         BorderRadius.circular(10), // Add rounded corners
//                     child: LinearProgressIndicator(
//                       value: 0.2, // 10% completion
//                       backgroundColor: Colors.grey[300],
//                       valueColor: const AlwaysStoppedAnimation<Color>(
//                         Color.fromARGB(255, 53, 97, 229), // Progress bar color
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Positioned.fill(
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 8.0),
//                       child: Text(
//                         '1/10',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'New word! Tap to select',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Image.asset(
//                     'assets/images/namaste.png',
//                     width: 200,
//                     height: 200,
//                   ),
//                   const SizedBox(height: 5),
//                   const Text(
//                     'Greetings',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   Row(
//                     children: [
//                       Container(
//                         height: 50,
//                         width: MediaQuery.of(context).size.width * 0.7,
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(255, 255, 255, 255),
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(15),
//                           ),
//                           border: Border.all(
//                             color: const Color.fromARGB(255, 125, 125, 125),
//                           ),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Color.fromARGB(255, 213, 213, 213),
//                               offset: Offset(0, 7),
//                             ),
//                           ],
//                         ),
//                         child: const Center(
//                           child: Text(
//                             'Hello',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       const CircleAvatar(
//                         backgroundColor: Color.fromARGB(255, 209, 222,
//                             226), // Change the background color as needed
//                         radius: 25, // Adjust the radius as needed
//                         child: Icon(
//                           Icons.volume_up,
//                           size: 30,
//                           color: Color.fromARGB(255, 53, 97, 229),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.15),
//                   GestureDetector(
//                     onTap: () {
//                       // Navigate to the next screen
//                       Navigator.pushNamed(context, AppRoute.courseContent2);
//                       // print('clicked');
//                     },
//                     child: Container(
//                       height: 50,
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 255, 138, 80),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(15),
//                         ),
//                         border: Border.all(
//                           color: const Color.fromARGB(255, 241, 92, 18),
//                         ),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Color.fromARGB(255, 241, 108, 42),
//                             offset: Offset(0, 7),
//                           ),
//                         ],
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'Continue',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
