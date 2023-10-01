import 'package:amrap/core/routes.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("By Kaz")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 80,
            ),
            Text(
              "smartwod",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 32),
            ),
            Text(
              "TIMER",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 80),
            ...[
              {
                'title': "AMRAP",
                'color': Colors.amber[800],
                'route': Routes.amrapUserInput
              },
              {
                'title': "FOR TIME",
                'color': Colors.blue,
                'route': Routes.amrapUserInput
              },
              {
                'title': "EMOM",
                'color': Colors.purple,
                'route': Routes.amrapUserInput
              },
              {
                'title': "TABATA",
                'color': Colors.tealAccent[700],
                'route': Routes.amrapUserInput
              },
              {
                'title': "MIX",
                'color': Colors.grey[800],
                'route': Routes.amrapUserInput
              },
            ]
                .map(
                  (e) => GestureDetector(
                    onTap: () => Routes.router.goNamed(e['route'] as String),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 4.0),
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: e['color'] as Color,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Text(
                        e['title'] as String,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
