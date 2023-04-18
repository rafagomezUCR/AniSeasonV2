import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class AnimeInfo extends StatelessWidget {
  const AnimeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Icon(Icons.arrow_back_ios_new),
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.red;
                          } else {
                            return Colors.transparent;
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text("Anime Details"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                      child: SizedBox(
                        height: screenHeight * .45,
                        width: screenWidth * .8,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("Anime Title"),
                    SizedBox(
                      height: 300,
                    ),
                    Text("Anime Title"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
