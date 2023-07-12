import 'package:extension_flutter/tabs/tabs.dart' as tabs;
import 'package:flutter/material.dart';
import 'package:chrome/src/js/tabs.dart' as binding;
import 'package:chrome/system_memory.dart';

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
  late Future<List<tabs.Tab>> _tabs;

  @override
  void initState() {
    super.initState();

    _tabs = tabs.tabs.query(queryInfo: tabs.QueryInfo(currentWindow: true));
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
          Slider(value: 1, onChanged: (v) {}, divisions: 10),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  var info = await chrome.systemMemory.getInfo();
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Memory ${info.capacity} / ${info.availableCapacity}')));
                  }
                },
                child: Text('Get Memory'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _tabs = tabs.tabs
                        .query(queryInfo: tabs.QueryInfo(currentWindow: false));
                  });
                },
                child: Text('List all Here'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _tabs = tabs.tabs
                        .query(queryInfo: tabs.QueryInfo(currentWindow: true));
                  });
                },
                child: Text('Current window'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              var newTab = await tabs.tabs.create(active: false);
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('New tab ${newTab.id}')));
              }
            },
            child: Text('Create'),
          ),
          Text(
              '${binding.chrome.tabs.MAX_CAPTURE_VISIBLE_TAB_CALLS_PER_SECOND}'),
          Expanded(
            child: FutureBuilder<List<tabs.Tab>>(
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
                        subtitle: Text(tab.status?.name ?? 'no-status'),
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
