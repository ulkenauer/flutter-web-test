import 'package:flutter/material.dart';
import 'package:test_web/domain/state/catalogue_state.dart';
import 'package:test_web/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    appServices.catalogueController.loadCatalogue();
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<CatalogueState>(
              stream: appServices.catalogueController.stream,
              builder: (context, snapshot) {
                final state =
                    snapshot.data ?? appServices.catalogueController.value;

                return Container(
                  height: 100,
                  width: 100,
                  color: state.isLoading ? Colors.blue : Colors.yellow,
                );
              },
            ),
            const SelectableText(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
