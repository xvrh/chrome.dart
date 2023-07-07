import 'package:extension_flutter/tabs/tabs.dart' as chrome;
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<chrome.Tab>> _tabs;

  @override
  void initState() {
    super.initState();

    _tabs = chrome.tabs.query(queryInfo: chrome.QueryInfo(currentWindow: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                _tabs = chrome.tabs
                    .query(queryInfo: chrome.QueryInfo(currentWindow: true));
              });
            },
            child: Text('Refresh Here'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _tabs = chrome.tabs.query(queryInfo: chrome.QueryInfo());
              });
            },
            child: Text('Refresh all'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _tabs = chrome.tabs.query();
              });
            },
            child: Text('Refresh all empty'),
          ),
          Expanded(
            child: FutureBuilder<List<chrome.Tab>>(
              future: _tabs,
              builder: (context, snapshot) {
                print('Got $snapshot');
                if (snapshot.hasError) {
                  return ErrorWidget(snapshot.error!);
                } else if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                var data = snapshot.requireData;
                return ListView(
                  children: [
                    ListTile(
                      title: Text('${data.length}'),
                    ),
                    for (var tab in data)
                      ListTile(
                        leading: Text(tab.id.toString()),
                        title: Text(tab.title ?? '<not-available>'),
                        subtitle: Text(tab.status.name),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
