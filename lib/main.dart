import 'package:flutter/material.dart';
import 'package:flutter_use_case/core/init/main_build.dart';

import 'example/network_change_example.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      builder: MainBuild.build,
      home: NetworkChangeView(),
    );
  }
}