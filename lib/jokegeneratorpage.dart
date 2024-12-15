import 'package:flutter/material.dart';
import 'package:laugh_a_little/joke.dart';
import 'package:laugh_a_little/main.dart';
import 'package:provider/provider.dart';

class JokeGeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    Future<Joke> joke = appState.current;

    IconData laugh;
    IconData next;
    if (appState.favorites.contains(joke)) {
      laugh = Icons.add_reaction;
      next = Icons.navigate_next;
    } else {
      laugh = Icons.add_reaction_outlined;
      next = Icons.navigate_next_outlined;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          JokeCard(joke: joke),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(laugh),
                label: Text('Hahaha'),
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                  onPressed: () {
                    appState.getNext();
                  },
                  icon: Icon(next),
                  label: Text('Next'))
            ],
          ),
        ],
      ),
    );
  }
}
