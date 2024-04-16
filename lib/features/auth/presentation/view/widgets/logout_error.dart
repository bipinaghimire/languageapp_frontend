import 'package:flutter/material.dart';

void logoutshowErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Icon(Icons.logout_outlined, color: Colors.red),
            ), // Error icon
            SizedBox(width: 10),
            Text(
              "Logout",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 24, // Adjusted font size
                fontWeight: FontWeight.bold,
              ),
            ), // Error title
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
                'Are you sure you want to logout?'), // Display error message
            const SizedBox(height: 20),
            SizedBox(
              width:
                  MediaQuery.of(context).size.width * 0.6, // Set button width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 240, 134, 81),
                  // elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize:
                      const Size(double.infinity, 40), // Adjusted button height
                ),
                child: const Text("Logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20, // Adjusted font size
                      fontWeight: FontWeight.bold,
                    )), // OK button
              ),
            ),
            SizedBox(
              width:
                  MediaQuery.of(context).size.width * 0.6, // Set button width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  // elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize:
                      const Size(double.infinity, 40), // Adjusted button height
                ),
                child: const Text("OK",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20, // Adjusted font size
                      fontWeight: FontWeight.bold,
                    )), // OK button
              ),
            ),
          ],
        ),
      );
    },
  );
}
