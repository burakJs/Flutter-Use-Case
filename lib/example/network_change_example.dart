import 'package:flutter/material.dart';

class NetworkChangeView extends StatefulWidget {
  const NetworkChangeView({super.key});

  @override
  State<NetworkChangeView> createState() => _NetworkChangeViewState();
}

class _NetworkChangeViewState extends State<NetworkChangeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Placeholder(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
