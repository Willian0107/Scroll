import 'package:flutter/material.dart';

class ScrollablePage extends StatelessWidget {
  // Lista de rutas de imágenes
  final List<String> imagePaths = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Scrollable'),
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pop(context); // Regresar a la página anterior
              },
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 40, 52, 58),
        ),
        body: Container(
          color: Color.fromARGB(255, 13, 16, 17), // Color de fondo para el body
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                child: TabBar(
                  isScrollable: true,
                  onTap: (selectedTabIndex) {},
                  tabs: [
                    Tab(child: Text("Mas populares")),
                    Tab(child: Text("Lo mas nuevo")),
                    Tab(child: Text("Trending topic")),
                    Tab(child: Text("Novedades")),
                    Tab(child: Text("Noticias")),
                    Tab(child: Text("Creaciones")),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: List.generate(
                    6,
                    (index) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePaths[index]),
                          fit: BoxFit.cover,
                        ),
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
}


void main() {
  runApp(
    MaterialApp(
      home: ScrollablePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
