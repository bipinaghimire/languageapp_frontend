import 'package:flutter/material.dart';
import 'package:languageapp_frontend/config/router/app_routes.dart';

class PreDashboardScreen extends StatefulWidget {
  const PreDashboardScreen({super.key});

  @override
  _PreDashboardScreenState createState() => _PreDashboardScreenState();
}

class _PreDashboardScreenState extends State<PreDashboardScreen> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, '/loginscreen');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hello User,',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 240, 134, 81),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    IconData(
                      0x1F44B,
                      fontFamily: 'Emoji',
                    ),
                    color: Color.fromARGB(255, 240, 134, 81),
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Languages you would like to learn?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              buildRadioListTile(context, title: 'Nepali', value: 'nepali'),
              const SizedBox(height: 20),
              buildRadioListTile(context, title: 'Newari', value: 'newari'),
              const SizedBox(height: 20),
              buildRadioListTile(context, title: 'Maithili', value: 'maithili'),
              const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () async {
              //     Navigator.pushNamed(context, AppRoute.userLevelRoute);
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: const Color.fromARGB(255, 255, 163, 76),
              //     elevation: 5,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8.0),
              //     ),
              //     minimumSize: const Size(double.infinity, 50),
              //   ),
              //   child: const Text(
              //     'Continue',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 24,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  // Navigate to the next screen
                  Navigator.pushNamed(context, AppRoute.userLevelRoute);
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
    );
  }

  Widget buildRadioListTile(BuildContext context,
      {required String title, required String value}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: selectedLanguage == value
                ? const Color.fromARGB(255, 240, 134, 81)
                : const Color.fromARGB(255, 235, 235, 235),
            width: 1.5, // Increased border width
          ),
          color: selectedLanguage == value
              ? const Color.fromARGB(255, 240, 134, 81).withOpacity(0.2)
              : const Color.fromARGB(255, 241, 241, 241),
        ),
        child: RadioListTile<String>(
          title: Row(
            children: [
              Container(
                width: 44, // Increased width of the circle container
                height: 44, // Increased height of the circle container
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selectedLanguage == value
                        ? const Color.fromARGB(255, 240, 134, 81)
                        : const Color.fromARGB(255, 255, 255, 255),
                    width: 1.5, // Increased border width
                    //change background color of the circle container
                  ),
                  color: selectedLanguage == value
                      ? const Color.fromARGB(255, 252, 173, 133)
                          .withOpacity(0.3)
                      : const Color.fromARGB(255, 255, 255, 255),
                ),
                alignment: Alignment.center,
                child: Text(
                  title[0], // First letter of the title
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: selectedLanguage == value
                        ? const Color.fromARGB(255, 240, 134, 81)
                        : Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          value: value,
          groupValue: selectedLanguage,
          onChanged: (value) {
            setState(() {
              selectedLanguage = value;
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor: selectedLanguage == value
              ? const Color.fromARGB(255, 240, 134, 81)
              : Colors.black,
        ),
      ),
    );
  }
}
