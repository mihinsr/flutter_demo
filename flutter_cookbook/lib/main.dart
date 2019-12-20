import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'NextView.dart' as nextView;

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = WordPair.random(); // Add this line.
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Welcome to Flutter'),
//         ),
//         body: Center(
//           //child: Text('Hello World'),   // Replace this text...
//           child: Text(wordPair.asPascalCase),  // With this text.
//         ),
//       ),
//     );
//   }
// }

class RandomWordsState extends State<RandomWords>{
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();   // Add this line.
  final TextStyle _biggerFont = const TextStyle(
    fontSize: 18
  );

  // @override                                  // Add from this line ... 
  // Widget build(BuildContext context) {
  //     final wordPair = WordPair.random(); // Add this line.
  //     return Text(wordPair.asPascalCase);
  // }

    @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random(); // Delete these... 
    //return Text(wordPair.asPascalCase); // ... two lines.

    return Scaffold (                   // Add from here... 
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[      // Add 3 lines from here...
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],                      // ... to here.
      ),
      body: _buildSuggestions(),
    );                                      // ... to here.
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),

      itemBuilder: (BuildContext _context, int i) {

        

        if (i.isOdd) {
          return Divider();
        }
        final int index = i ~/2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(   // Add the lines from here... 
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null),
        onTap: () {      // Add 9 lines from here...
          setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
         } else { 
           _saved.add(pair); 
         } 
        //  print("Click");
        });
      }
      );
    }

    void _pushSaved() {
      
      prefix0.Navigator.push(context, MaterialPageRoute(builder: (context)=> nextView.NextView(name: "okay")));
      return;

      // Navigator.of(context).push(
      //   MaterialPageRoute<void>(   // Add 20 lines from here...
      //     builder: (BuildContext context) {
      //       final Iterable<ListTile> tiles = _saved.map(
      //         (WordPair pair) {
      //           return ListTile(
      //             title: Text(
      //               pair.asPascalCase,
      //               style: _biggerFont,
      //             ),
      //           );
      //         },
      //       );
      //       final List<Widget> divided = ListTile
      //         .divideTiles(
      //           context: context,
      //           tiles: tiles,
      //         )
      //         .toList();
            
      //       return Scaffold(         // Add 6 lines from here...
      //       appBar: AppBar(
      //       title: Text('Saved Suggestions'),
      //       ),
      //       body: ListView(children: divided),
      //       );  
      //     },
      //   ),                       // ... to here.
      // );
    }

}


class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();
}

class MyApp extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   final WordPair wordPair = WordPair.random();  // Delete this line.

  //   return MaterialApp(
  //     title: 'Welcome to Flutter',
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text('Welcome to Flutter'),
  //       ),
  //       body: Center(
  //         //child: Text(wordPair.asPascalCase), // Change this line to... 
  //         child: RandomWords(),                 // ... this line.
  //       ),
  //     ),
  //   );
  // }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      
      home: RandomWords()
      );
  }

// @override
//   Widget build(BuildContext context) {
//     //final wordPair = WordPair.random(); // Delete these... 
//     //return Text(wordPair.asPascalCase); // ... two lines.

//     return Scaffold (                   // Add from here... 
//       appBar: AppBar(
//         title: Text('Startup Name Generator'),
//       ),
//       body: _buildSuggestions(),
//     );                                      // ... to here.
//   }

}