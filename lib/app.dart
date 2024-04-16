import 'package:flutter/material.dart';
import 'package:languageapp_frontend/config/router/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splashRoute,
      title: 'Language App',
      routes: AppRoute.getAppRoutes(),
    );
  }
}

      // routes: {
      //   '/': (context) => const SplashScreen(),
      //   '/login_signup': (context) => const LoginSignupScreen(),
      //   '/signup_screen': (context) => const SignupScreen(),
      //   '/signup_success': (context) => const SignupSuccessScreen(),
      //   '/login_screen': (context) => const LoginScreen(),
      //   '/dashboard': (context) => const DashboardScreen(),
      //   '/bottom_navigations': (context) => const BottomNavigations(),
      //   '/pre_dashboard': (context) => const PreDashboardScreen(),
      //   '/user_level': (context) => const UserLevelScreen(),
      //   '/user_settings': (context) => const UserSettingsScreen(),
      //   '/course_content': (context) => const CourseDetailScreen(),
      // },