import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Systéme d''irrigation intelligent',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Systéme d'' irrigation intelligent'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  bool On=false;
  final dbR = FirebaseDatabase.instance.reference();

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
      
      Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            On?Icon(Icons.lightbulb,size:100,color: Colors.amber.shade700,):Icon(
              Icons.lightbulb_outline,
              size: 100,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor:On? Colors.green:Colors.white10
              ),
                onPressed: (){
                dbR.child("Light").set({"Switch": !On});
                setState(() {
                  On=!On;
                });
                },
                child: On?Text("Led On"):Text("Led Off")),
            const Text(
              'we are testing the app:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
