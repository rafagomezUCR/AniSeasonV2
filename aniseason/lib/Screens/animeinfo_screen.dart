import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class AnimeInfo extends StatelessWidget {
  const AnimeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Anime Info"),
            FloatingActionButton(
              onPressed: () {
                context.pop();
              },
              child: Text("return"),
            ),
          ],
        ),
      ),
    );
  }
}
