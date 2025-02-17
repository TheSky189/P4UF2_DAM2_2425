import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // ✅ Centra todo el contenido en la pantalla
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // ✅ Evita que la columna ocupe toda la pantalla
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/logo.png", height: 120), // Logotipo
              const SizedBox(height: 20),
              const Text(
                "Bienvenido!",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ), // Slogan
              const SizedBox(height: 20),
              const CircularProgressIndicator(), // Animación de carga
            ],
          ),
        ),
      ),
    );
  }
}
