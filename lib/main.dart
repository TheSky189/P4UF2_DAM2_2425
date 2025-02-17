import 'package:flutter/material.dart';
import 'package:flutter_application_1/routing/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Verificar si el usuario ya ha iniciado sesion
  bool isLoggedIn = prefs.getString('username') != null;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login APP',
      theme: ThemeData(
          //brightness: Brightness.dark,
          ),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
