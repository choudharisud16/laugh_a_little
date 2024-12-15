import 'package:flutter/material.dart';
import 'package:laugh_a_little/main.dart';
import 'package:provider/provider.dart';

class FavoriteJokesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('Not laughed yet!'),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Make others laugh or break the ice by sharing one of the jokes from '
            '${appState.favorites.length} jokes you have laughed on!',
          ),
        ),
        for (var pair in appState.favorites)
          FutureBuilder(
              future: pair,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListTile(
                    leading: Icon(Icons.emoji_emotions),
                    title: Text(
                        '${snapshot.data!.setup} punchline- ${snapshot.data!.punchline}'),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
      ],
    );
  }
}
