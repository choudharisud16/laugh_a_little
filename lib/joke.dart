//needed for json decode
import 'dart:convert';

//needed for await http reuqest
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//joke class to assign to future type
class Joke {
  final String type;
  final String setup;
  final String punchline;
  final int id;

  const Joke(
      {required this.type,
      required this.setup,
      required this.punchline,
      required this.id});
}

//Future call/api request for getting joke
Future<Joke> fetchJoke() async {
  final response = await http
      .get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var responseData = json.decode(response.body);
    Joke joke = Joke(type: '', setup: '', punchline: '', id: 0);
    joke = Joke(
        type: responseData['type'],
        setup: responseData['setup'],
        id: responseData['id'],
        punchline: responseData['punchline']);
    return joke;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to fetch Joke');
  }
}

//JokeCard- display fetched joke on card
class JokeCard extends StatelessWidget {
  const JokeCard({
    super.key,
    required this.joke,
  });

  final Future<Joke> joke;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Center(
      child: FutureBuilder(
          future: joke,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: theme.colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data!.setup,
                          style: style,
                        ),
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.white,
                      indent: 10,
                      endIndent: 10,
                    ),
                    ExpansionTile(
                      //backgroundColor: theme.colorScheme.primary,
                      title: Text(
                        'Puncline',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      children: [
                        Card(
                          color: theme.colorScheme.primary,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              snapshot.data!.punchline,
                              style: style,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
