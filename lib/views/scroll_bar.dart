import 'package:flutter/material.dart';

class ScrollbarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scrollbar'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Regresar a la página anterior
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Lógica para manejar el botón de inicio
              },
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 40, 52, 58),
        ),
        body: RawScrollbarExample(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RawScrollbarExample extends StatefulWidget {
  const RawScrollbarExample({Key? key}) : super(key: key);

  @override
  State<RawScrollbarExample> createState() => _RawScrollbarExampleState();
}

class _RawScrollbarExampleState extends State<RawScrollbarExample> {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            SizedBox(
              width: constraints.maxWidth / 2,
              child: Scrollbar(
                thumbVisibility: true,
                controller: _firstController,
                child: ListView.builder(
                  controller: _firstController,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('Scrollable 1 : Willian $index'),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth / 2,
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView.builder(
                  primary: true,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 60,
                      color: index.isEven
                          ? Color.fromARGB(255, 21, 86, 79)
                          : Color.fromARGB(255, 18, 87, 101),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Scrollable 2 : Martínez $index'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: ScrollbarPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
