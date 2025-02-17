import 'package:flutter/material.dart';

class CityDetailsPage extends StatelessWidget {
  final Map<String, String> city;
  final Function onDelete; // para eliminar ciudad

  const CityDetailsPage(
      {super.key, required this.city, required this.onDelete});

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Eliminar Ciudad"),
          content: const Text("¿Estas seguro eliminar esta ciudad?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                onDelete();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("Eliminar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city['name']!),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"), // Imagen de fondo
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // Centrar todo el contenido
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centrar contenido
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centrar horizontalmente
              children: [
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    city['image']!,
                    width: 800, // Ajusta el tamaño para que quede centrado
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    city['description']!,
                    style: const TextStyle(fontSize: 18, color: Colors.black87),
                    textAlign: TextAlign.center,
                    // Centra el texto
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _showDeleteDialog(context);
                  },
                  child: const Text("Eliminar Ciudad"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
