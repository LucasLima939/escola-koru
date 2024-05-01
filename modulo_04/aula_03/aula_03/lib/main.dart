import 'package:flutter/material.dart';

import 'chat_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF048C5A),
          primary: const Color(0xFF048C5A),
          secondary: const Color(0xFF0CC13E),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'WhatsApp',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: const [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 20),
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: <Widget>[
          _buildTabs(),
          _buildChat(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  Widget _buildChat() => Expanded(
          child: ListView(
        children: const [
          ChatTile(title: 'James', date: '12:40', notifications: 2),
          ChatTile(title: 'John', date: '4 NOV', notifications: 2),
          ChatTile(title: 'Nana', date: '1 NOV'),
          ChatTile(title: 'Karin', date: '1 NOV'),
          ChatTile(title: 'Bond', date: '1 NOV'),
          ChatTile(title: 'Johnson', date: '1 NOV'),
          ChatTile(title: 'Nana', date: '1 NOV'),
          ChatTile(title: 'Karin', date: '1 NOV'),
          ChatTile(title: 'Bond', date: '1 NOV'),
        ],
      ));

  Widget _buildTabs() => Container(
        color: Theme.of(context).colorScheme.primary,
        height: 40,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            const Padding(
                padding: EdgeInsets.only(left: 20), child: Icon(Icons.camera_alt, color: Colors.white, size: 22)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 40,
                      width: 50,
                      decoration:
                          const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white, width: 2.0))),
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text('CHAT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ))),
                  const Text('STATUS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  const Text('CALLS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      );
}
