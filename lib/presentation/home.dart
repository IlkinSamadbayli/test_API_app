import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${context.watch<AppProvider>().counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer<AppProvider>(
                  builder: (context, value, child) => FloatingActionButton(
                    onPressed: () => context.read<AppProvider>().decreacement,
                    tooltip: 'Decreament',
                    child: const Icon(Icons.remove),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () => context.read<AppProvider>().reset,
                  tooltip: 'Reset',
                  child: const Icon(Icons.restore_outlined),
                ),
                FloatingActionButton(
                  onPressed: () => context.read<AppProvider>().increment,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
