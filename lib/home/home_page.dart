import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/example/bloc');
                  },
                  child: Text('Example')),
              ElevatedButton(onPressed: () {}, child: Text('Example Freezed')),
              ElevatedButton(onPressed: () {}, child: Text('Contacts')),
              ElevatedButton(onPressed: () {}, child: Text('Contact Cubit')),
            ],
          ),
        ),
      ),
    );
  }
}
