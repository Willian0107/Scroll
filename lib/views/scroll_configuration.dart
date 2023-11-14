import 'package:flutter/material.dart';

class ScrollConfigurationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollConfiguration'),
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal, Colors.blue],
          ),
        ),
        child: ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: ListView.builder(
            itemCount: 11,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.transparent,
                elevation: 7.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: ListTile(
                  title: Text(
                    'BMO Artistic $index',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Misión Completada $index',
                    style: TextStyle(color: Colors.white70),
                  ),
                  leading: Icon(Icons.palette, color: Colors.white),
                  trailing: Icon(Icons.arrow_forward, color: Colors.black),
                  onTap: () {
                    // Acción al hacer clic en un elemento de la lista
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Clase que define el comportamiento personalizado del desplazamiento
class CustomScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return GlowingOverscrollIndicator(
      axisDirection: axisDirection,
      color: Colors.red,
      notificationPredicate: (notification) {
        return true;
      },
      child: child,
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: ScrollConfigurationPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
