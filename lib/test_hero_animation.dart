import 'package:flutter/material.dart';

class TestHeroAnimations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Hero(tag: 'test', child: Icon(Icons.add)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ToHeroAnimation(),
              ),
            );
          },
          child: const Text("go to second page"),
        ),
      ),
    );
  }
}

class ToHeroAnimation extends StatelessWidget {
  const ToHeroAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'test',
              flightShuttleBuilder: (flightContext, animation, direction,
                  fromContext, toContext) {
                return const Icon(
                  Icons.rocket,
                  size: 150.0,
                );
              },
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
