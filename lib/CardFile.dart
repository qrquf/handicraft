import 'package:flutter/material.dart';


/// This Widget is the main application widget.
class CardFile extends StatelessWidget {
  const CardFile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Card Example')),
        backgroundColor: Colors.yellow,
        body: MyCardWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyCardWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 300,
          height: 250,
          //padding: new EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.red,
            elevation: 10,
            // child: Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: <Widget>[
            //     const ListTile(
            //       leading: Icon(Icons.album, size: 60),
            //       title: Text(
            //           'Sonu Nigam',
            //           style: TextStyle(fontSize: 30.0)
            //       ),
            //       subtitle: Text(
            //           'Best of Sonu Nigam Music.',
            //           style: TextStyle(fontSize: 18.0)
            //       ),
            //     ),
            //     ButtonBar(
            //       children: <Widget>[
            //         ElevatedButton(
            //           child: const Text('Play'),
            //           onPressed: () {/* ... */},
            //         ),
            //         ElevatedButton(
            //           child: const Text('Pause'),
            //           onPressed: () {/* ... */},
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ),
        )
    );
  }
}