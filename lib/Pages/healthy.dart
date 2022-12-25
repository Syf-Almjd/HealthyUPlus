import 'package:flutter/material.dart';

class healthy extends StatelessWidget {
  const healthy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Text(

                "healthy", style: Theme.of(context).textTheme.overline,

            ),
        ),
      ),
    );
  }
}
