import 'package:flutter/material.dart';
import 'views/scroll_configuration.dart';
import 'views/scrollable.dart';
import 'views/scroll_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: InicioScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InicioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/bmo.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                        
                      ),
                    );
                  },
                  child: Text('INICIAR'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          color: const Color.fromARGB(255, 30, 66, 85),
          child: AppBar(
            title: Text('SCROLLS'),
            actions: [
              DropdownButton<String>(
                onChanged: (value) {
                  switch (value) {
                    case 'ScrollConfiguration':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScrollConfigurationPage(),
                        ),
                      );
                      break;
                    case 'Scrollbar':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScrollbarPage(),
                        ),
                      );
                      break;
                    case 'Scrollable':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScrollablePage(),
                        ),
                      );
                      break;
                  }
                },
                items: [
                  DropdownMenuItem(
                    value: 'ScrollConfiguration',
                    child: Text('ScrollConfiguration'),
                  ),
                  DropdownMenuItem(
                    value: 'Scrollbar',
                    child: Text('Scrollbar'),
                  ),
                  DropdownMenuItem(
                    value: 'Scrollable',
                    child: Text('Scrollable'),
                  ),
                ],
              ),
            ],
                      backgroundColor: Color.fromARGB(255, 40, 53, 59), // Puedes cambiar el color por defecto aquí

          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/scroll.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Puedes agregar más contenido si es necesario
            ],
          ),
        ),
      ),
    );
  }
}
