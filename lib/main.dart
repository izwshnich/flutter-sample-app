import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Counter(title: 'Flutter Demo Home Page'),
    );
  }
}

class Counter extends HookWidget {
  Counter({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    final controller = useTextEditingController();
    final update = useValueListenable(controller);

    useEffect(() {
      counter.value = update.text.length;
    }, [update]);

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '山田',
                ),
                maxLength: 10,
              ),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('${counter.value.toString()} / 10')),
            ],
          ),
        ),
      ),
    );
  }
}
