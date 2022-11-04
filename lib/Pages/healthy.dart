import 'package:flutter/material.dart';

class healthy extends StatefulWidget {
  const healthy({Key? key}) : super(key: key);

  @override
  State<healthy> createState() => _healthyState();
}

class _healthyState extends State<healthy> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Text(
                "healthy"
            )
        ),
      ),
    );
  }
}
