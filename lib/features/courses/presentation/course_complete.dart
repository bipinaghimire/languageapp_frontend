import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:languageapp_frontend/config/router/app_routes.dart';

class CourseCompleteScreen extends ConsumerStatefulWidget {
  const CourseCompleteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CourseCompleteScreenState();
}

class _CourseCompleteScreenState extends ConsumerState<CourseCompleteScreen> {
  Future<bool> _onWillPop() async {
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 240, 134, 81),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'You have completed the course',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // Navigate to the next screen
                    Navigator.pushNamed(context, AppRoute.bottomNavigations);
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
      ),
    );
  }
}
