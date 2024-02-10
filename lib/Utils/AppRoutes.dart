
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:secure_notes/Screens/Dashboard/DashboardScreen.dart';
import 'package:secure_notes/Screens/Login/LoginScreen.dart';
import 'package:secure_notes/Screens/NoteEntry/NoteEntryScreen.dart';
import 'package:secure_notes/Screens/Splash/SplashScreen.dart';
import 'package:secure_notes/Screens/Welcome/WelcomeScreen.dart';


class AppRoutes{

  static AppRoutes instance = AppRoutes();

  /// All pages
  List<GetPage> routeList = [
    GetPage(name: "/splashPage", page: () => SplashScreen(),transition: Transition.native),
    GetPage(name: "/loginPage", page: () => const LoginScreen(),transition: Transition.native),
    GetPage(name: "/welcomePage", page: () =>  WelcomeScreen(),transition: Transition.native),
    GetPage(name: "/dashboardPage", page: () =>  DashboardScreen(),transition: Transition.native),
    GetPage(name: "/NoteInputPage", page: () =>  NoteEntryScreen(),transition: Transition.native),
  ];


}