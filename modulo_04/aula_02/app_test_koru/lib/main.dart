import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(titulo: 'Meu título personalizado'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String titulo;
  final Color? backgroundColor;
  const MyHomePage({super.key, required this.titulo, this.backgroundColor = Colors.red});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.titulo),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                    color: Colors.black,
                    strokeAlign: 2.0,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 20,
                      width: 20,
                      margin: EdgeInsets.only(left: 20),
                      color: Colors.white,
                    ),
                  ),
                  Text('Hello World'),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 20,
                      width: 20,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
