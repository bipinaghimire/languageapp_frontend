import 'package:flutter/material.dart';

class DashboardAppbar extends StatelessWidget {
  const DashboardAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(
                      255, 237, 237, 237), // Adjust color as needed
                ),
                child: const Text(
                  'N', // Initial letter of content
                  style: TextStyle(
                    color: Colors.orange, // Adjust color as needed
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              margin: const EdgeInsets.only(right: 20.0),
              width: 100, // Adjust width as needed
              child: DropdownButton<String>(
                isExpanded: true, // Allow the dropdown to expand horizontally
                isDense: true, // Reduce vertical padding
                value: 'Nepali', // Default value
                onChanged: (String? newValue) {
                  // Handle dropdown value change
                },
                items: <String>['Nepali', 'Newari', 'Maithili']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Add functionality for settings icon
          },
        ),
      ],
    );
  }
}
