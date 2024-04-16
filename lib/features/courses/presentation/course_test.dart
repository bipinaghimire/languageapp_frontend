import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:languageapp_frontend/config/router/app_routes.dart';

class CourseTestScreen extends ConsumerStatefulWidget {
  const CourseTestScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CourseTestScreenState();
}

class _CourseTestScreenState extends ConsumerState<CourseTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 1.2'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 20, // Adjust height for thicker line
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10), // Add rounded corners
                      child: LinearProgressIndicator(
                        value: 0.2, // 10% completion
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(
                              255, 53, 97, 229), // Progress bar color
                        ),
                      ),
                    ),
                  ),
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          '10%',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Select the correct image',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(
                          color: const Color.fromARGB(255, 125, 125, 125),
                        ),
                        // boxShadow: const [
                        //   BoxShadow(
                        //     color: Color.fromARGB(255, 213, 213, 213),
                        //     offset: Offset(0, 7),
                        //   ),
                        // ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Namaste',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
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
                    ),
                    const SizedBox(width: 20),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context, AppRoute.courseContent2);
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 275,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Color.fromARGB(
                                                    255, 255, 111, 111),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 232, 31, 31),
                                                  radius:
                                                      18, // Adjust the radius as needed
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 30,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'Incorrect !',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 232, 31, 31),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          const Divider(),
                                          const SizedBox(height: 20),
                                          const Text(
                                            'Correct Answer',
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 232, 31, 31),
                                            ),
                                          ),
                                          const Text(
                                            'Namaste: Greetings',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 232, 31, 31),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          GestureDetector(
                                            onTap: () {
                                              // Navigate to the next screen
                                              Navigator.pushNamed(context,
                                                  AppRoute.courseComplete);
                                              // print('clicked');
                                            },
                                            child: Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 255, 111, 111),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                      255, 232, 31, 31),
                                                ),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                        255, 232, 31, 31),
                                                    offset: Offset(0, 7),
                                                  ),
                                                ],
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Continue',
                                                  style: TextStyle(
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
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/namaste.png',
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                'Namaste',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context, AppRoute.courseContent2);
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 275,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Color.fromARGB(
                                                    255, 114, 168, 244),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 31, 115, 232),
                                                  radius:
                                                      18, // Adjust the radius as needed
                                                  child: Icon(
                                                    Icons.check,
                                                    size: 30,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'Correct!',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 31, 115, 232),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          const Divider(),
                                          const SizedBox(height: 20),
                                          const Text(
                                            'Namaste: Greetings',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 31, 115, 232),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          GestureDetector(
                                            onTap: () {
                                              // Navigate to the next screen
                                              Navigator.pushNamed(context,
                                                  AppRoute.courseComplete);
                                            },
                                            child: Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 114, 168, 244),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                      255, 31, 115, 232),
                                                ),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                        255, 31, 115, 232),
                                                    offset: Offset(0, 7),
                                                  ),
                                                ],
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Continue',
                                                  style: TextStyle(
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
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/byebye.png',
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                'Ta ta',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/ghar.png',
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(width: 20),
                            const Text(
                              'Ghar',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 40),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/go.png',
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(width: 20),
                            const Text(
                              'Jau',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the next screen
                        Navigator.pushNamed(context, AppRoute.courseComplete);
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
                            'Check',
                            style: TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}
