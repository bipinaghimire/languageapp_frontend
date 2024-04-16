import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:languageapp_frontend/config/constants/google_sign_in.dart';
import 'package:languageapp_frontend/config/router/app_routes.dart';
// import 'package:flutter_launcher_icons/ios.dart' as LauncherIcons;

class UserSettingsScreen extends ConsumerStatefulWidget {
  const UserSettingsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserSettingsScreenState createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends ConsumerState<UserSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    // final authviewmodel = ref.read(authViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView(
          children: [
            const Text(
              'Others',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: const Text('Notifications'),
              leading: _buildCircleAvatar(Icons.notifications_outlined),
              trailing: Switch(
                value: true,
                onChanged: (value) {
                  // Handle setting 1 change
                },
                activeColor:
                    const Color.fromARGB(255, 230, 123, 70), // Light orange
                inactiveThumbColor: Colors.white, // White circle when false
                inactiveTrackColor: const Color.fromARGB(
                    255, 153, 68, 34), // Dark orange background when false
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            ),

            const Divider(), // Add Divider after first ListTile
            ListTile(
              title: const Text('Sound Effects'),
              leading: _buildCircleAvatar(Icons.volume_up_outlined),
              trailing: Switch(
                value: false,
                onChanged: (value) {
                  // Handle setting 2 change
                },
              ),
            ),
            const Divider(), // Add Divider after second ListTile
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Help & Info',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: const Text('Support & Help'),
              leading: _buildCircleAvatar(Icons.help_outline),
              onTap: () {
                // Handle change password
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 85, 82, 82),
              ),
            ),
            const Divider(), // Add Divider after third ListTile
            ListTile(
              title: const Text('Terms and Conditions'),
              leading: _buildCircleAvatar(Icons.info_outline),
              onTap: () {
                // Handle change password
              },
            ),
            const Divider(), // Add Divider after fourth ListTile
            ListTile(
              title: const Text('Privacy Policy'),
              leading: _buildCircleAvatar(Icons.privacy_tip_outlined),
              onTap: () {
                // Handle change password
              },
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: const Text('Your Personal Details'),
              leading: _buildCircleAvatar(Icons.person_outline),
              onTap: () {
                // Handle change password
              },
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 85, 82, 82),
              ),
            ),
            const Divider(), // Add Divider after sixth ListTile
            ListTile(
              title: const Text('Logout'),
              leading: _buildCircleAvatar(Icons.logout_outlined),
              onTap: () {
                // authviewmodel.logoutUser(context);
                Navigator.pushNamed(context, AppRoute.loginsignup);
                //google signout
                // signOut(context);
              },
            ),
            const Divider(), // Add Divider after seventh ListTile
            ListTile(
              title: const Text(
                'Delete Account',
                style: TextStyle(color: Color.fromARGB(255, 182, 20, 8)),
              ),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      const Color.fromARGB(255, 248, 150, 101).withOpacity(0.2),
                ),
                child: const Icon(
                  Icons.delete_outline,
                  color: Color.fromARGB(255, 182, 20, 8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleAvatar(IconData iconData) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color.fromARGB(255, 248, 150, 101).withOpacity(0.2),
      ),
      child: Icon(
        iconData,
        color: const Color.fromARGB(255, 234, 96, 28),
      ),
    );
  }

  Future<void> signOut(BuildContext context) async {
    final user = await GoogleSignInApi.signOut();
    if (user == null) {
      print('Sign in failed');
      Navigator.popAndPushNamed(context, AppRoute.loginsignup);
    } else {
      print(user);
      print('success');
      Navigator.popAndPushNamed(context, AppRoute.loginsignup);
    }
  }
}
