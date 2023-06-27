import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Material 3 Key Changes',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        elevation: 8,
        shadowColor: Theme.of(context).shadowColor,
      ),
      body: Container(
        width: double.infinity,
        height: 200,
        color: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Hello, Material 3!',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
