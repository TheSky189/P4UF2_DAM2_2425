import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/pages/city_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _username = "usuario"; // Valor predeterminado

  @override
  void initState() {
    super.initState();
    _loadUsername(); // Cargar el usuario al iniciar la pantalla
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ??
          "usuario"; // Recupera el usuario guardado
    });
  }

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');
    Navigator.pushReplacementNamed(context, '/login');
  }

  final List<Map<String, String>> cities = [
    {
      'name': 'Zúrich',
      'country': 'Suiza',
      'image': 'assets/zurich.jpg',
      'description':
          'Centro financiero de Suiza, con un hermoso lago y vida cultural activa.'
    },
    {
      'name': 'Reikiavik',
      'country': 'Islandia',
      'image': 'assets/reykjavik.jpg',
      'description':
          'Capital de Islandia, famosa por la aurora boreal y aguas termales.'
    },
    {
      'name': 'Oslo',
      'country': 'Noruega',
      'image': 'assets/oslo.jpg',
      'description': 'Ciudad moderna rodeada de fiordos y museos vikingos.'
    },
    {
      'name': 'Berlín',
      'country': 'Alemania',
      'image': 'assets/berlin.jpg',
      'description':
          'Capital de Alemania, con una historia fascinante y cultura vibrante.'
    },
    {
      'name': 'Helsinki',
      'country': 'Finlandia',
      'image': 'assets/helsinki.jpg',
      'description':
          'Ciudad de diseño escandinavo con inviernos nevados y saunas.'
    },
  ];

//  void _deleteCity(String cityName) {
//    setState(() {
//      cities.removeWhere((city) => city['name'] == cityName);
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¡Hola, $_username!'), // Muestra el nombre del usuario
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            final city = cities[index];
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Hero(
                  tag: city['name']!,
                  child: Image.asset(city['image']!,
                      width: 50, height: 50, fit: BoxFit.cover),
                ),
                title: Text(city['name']!,
                    style: const TextStyle(color: Colors.black)),
                subtitle: Text(city['country']!,
                    style: const TextStyle(color: Colors.black54)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CityDetailsPage(
                        city: city,
                        onDelete: () {
                          setState(() {
                            cities
                                .removeWhere((c) => c['name'] == city['name']);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
