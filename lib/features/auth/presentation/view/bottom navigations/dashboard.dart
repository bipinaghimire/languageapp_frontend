import 'package:flutter/material.dart';
import 'package:languageapp_frontend/config/router/app_routes.dart';
import 'package:languageapp_frontend/features/auth/presentation/view/widgets/dashboard_appbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const DashboardAppbar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Course 1',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'View Courses',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
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
                        Color.fromARGB(255, 53, 97, 229), // Progress bar color
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 0,
                  left: 8,
                  child: Text(
                    '10%',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '1/5 lessons completed',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Number of lessons
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        _buildCircle(index),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            // Handle lesson click
                            Navigator.pushNamed(
                                context, AppRoute.courseContentRoute);
                          },
                          child: Text(
                            _getLessonTitle(index),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 102, 102, 102),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(int index) {
    Color circleColor;
    if (index == 0) {
      circleColor = Colors.orange; // Orange for the first circle
    } else if (index == 1) {
      circleColor = Colors.grey; // Grey for the second circle
    } else {
      circleColor = Colors.black; // Black for the rest of the circles
    }

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: circleColor,
          width: 4,
        ),
      ),
    );
  }

  String _getLessonTitle(int index) {
    switch (index) {
      case 0:
        return '1.1 Introduction to the course';
      case 1:
        return '1.2 Say hi to your friends';
      case 2:
        return '1.3 Words for foods';
      case 3:
        return '1.4 About yourself';
      case 4:
        return '1.5 Speaking formally';
      default:
        return '';
    }
  }
}
