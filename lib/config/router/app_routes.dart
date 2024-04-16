import 'package:languageapp_frontend/features/auth/presentation/view/bottom%20navigations/dashboard.dart';
import 'package:languageapp_frontend/features/auth/presentation/view/bottom%20navigations/user_settings.dart';
import 'package:languageapp_frontend/features/auth/presentation/view/login/login_screen.dart';
import 'package:languageapp_frontend/features/auth/presentation/view/register/signup_screen.dart';
import 'package:languageapp_frontend/features/courses/presentation/course_complete.dart';
import 'package:languageapp_frontend/features/courses/presentation/course_content.dart';
import 'package:languageapp_frontend/features/courses/presentation/course_test.dart';
import 'package:languageapp_frontend/features/courses/presentation/test_course2.dart';
import 'package:languageapp_frontend/features/splashscreen/bottom_navigations.dart';
import 'package:languageapp_frontend/features/splashscreen/login_signup.dart';
import 'package:languageapp_frontend/features/splashscreen/pre_dashboard.dart';
import 'package:languageapp_frontend/features/splashscreen/splash_screen.dart';
import 'package:languageapp_frontend/features/splashscreen/user_level.dart';

class AppRoute {
  AppRoute._();
  static String splashRoute = '/';
  static String loginRoute = '/login_screen';
  static String signupRoute = '/signup_screen';
  static String loginsignup = '/login_signup';
  static String dashRoute = '/dashboard';
  static String bottomNavigations = '/bottom_navigations';
  static String preDashRoute = '/pre_dashboard';
  static String userLevelRoute = '/user_level';
  static String userSettingsRoute = '/user_settings';
  static String courseContentRoute = '/course_content';
  static String courseContent2 = '/course_content2';
  static String courseTest = '/course_test';
  static String courseComplete = '/course_complete';

  static getAppRoutes() {
    return {
      splashRoute: (context) => const SplashScreen(),
      loginRoute: (context) => const LoginScreen(),
      signupRoute: (context) => const SignupScreen(),
      dashRoute: (context) => const DashboardScreen(),
      loginsignup: (context) => const LoginSignupScreen(),
      bottomNavigations: (context) => const BottomNavigations(),
      preDashRoute: (context) => const PreDashboardScreen(),
      userLevelRoute: (context) => const UserLevelScreen(),
      userSettingsRoute: (context) => const UserSettingsScreen(),
      courseContentRoute: (context) => const CourseDetailScreen(),
      courseContent2: (context) => const CourseDetailScreen2(),
      courseTest: (context) => const CourseTestScreen(),
      courseComplete: (context) => const CourseCompleteScreen(),
    };
  }
}
