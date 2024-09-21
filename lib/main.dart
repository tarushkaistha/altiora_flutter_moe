import 'package:flutter/material.dart';
import 'package:moengage_flutter/moengage_flutter.dart';
	import 'package:moengage_inbox/moengage_inbox.dart';
  import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

void main() {
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

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {


        

  final MoEngageFlutter _moengagePlugin =
      MoEngageFlutter("Z1UDNSWJALFR3UTPWWMCSF5Z");

  final	MoEngageInbox _moEngageInbox = MoEngageInbox("Z1UDNSWJALFR3UTPWWMCSF5Z");


  @override
  void initState() {
    super.initState();
    initPlatformState();
    WidgetsBinding.instance.addObserver(this as WidgetsBindingObserver);
    debugPrint('$tag initState() : start ');
    _moengagePlugin.configureLogs(LogLevel.VERBOSE);

    _moengagePlugin.initialise();
  
    debugPrint('initState() : end ');
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
    //Push.getTokenStream.listen(_onTokenEvent, onError: _onTokenError);
  }
  final int _counter = 0;

  // void _startGeofenceMonitoring() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     //_counter++;
  //     debugPrint('Start GeoFence Monitoring - Flutter');
     
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
              onPressed: () { 	
                //_moengagePlugin.setAlias("Flutter One1"); 
                _moengagePlugin.setUniqueId("Flutter One1");
                },
              child: const Text('Click to set your unique Id or profile on MoEn dashboard'),
            ),

            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
              onPressed: () { 	
                	_moengagePlugin.setFirstName("Tony Stark");
                  _moengagePlugin.setPhoneNumber("8894");
                  var marvelproperties = MoEProperties();
                  marvelproperties.addAttribute("TonyStark", "Robert Downey");
                  _moengagePlugin.trackEvent("MarvelMutliverse",marvelproperties);
                },
              child: const Text('Click to track user attributes and events in flutter MoE'),
            ),

            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
              onPressed: () async{ 	
                	InboxData? data = await _moEngageInbox.fetchAllMessages();
                  if(data != null){
                    print("my inbox data : $data");
                    if(data.messages.isNotEmpty){
                        for(final InboxMessage message in data.messages){
                          print("notifications in my inbox with following messages : $message");
                        }
                    }
                  }
                },
              child: const Text('Click to get all push notifications in your inbox'),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
              onPressed: () async{ 	
                	InboxData? data = await _moEngageInbox.fetchAllMessages();
                  if(data != null){
                    print("my inbox data : $data");
                    if(data.messages.isNotEmpty){
                        for(final InboxMessage message in data.messages){
                          print("clicked notifications in my inbox with following messages : $message");
                          _moEngageInbox.trackMessageClicked(message);
                        }
                    }
                  }
                },
              child: const Text('Click to track push notifications on MoE db'),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
              onPressed: () async{ 	
                	int count = await _moEngageInbox.getUnClickedCount();
                  print("i have these much uncklicked notifications : $count");
                  Fluttertoast.showToast(
                    msg: "i have these much uncklicked notifications : $count",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 12.0
                  );
                },
              child: const Text('Click to get unclicked push notifications'),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
              onPressed: () async{ 	
                	InboxData? data = await _moEngageInbox.fetchAllMessages();
                  if(data!.messages.isNotEmpty){
                        for(final InboxMessage message in data.messages){
                          print("deleted notifications in my inbox : $message");
                          _moEngageInbox.deleteMessage(message);
                          Fluttertoast.showToast(
                            msg: "deleted notification(s) : $message",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 12.0
                          );
                        }
                    }
                    else {
                      Fluttertoast.showToast(
                            msg: "add push notifications in inbox to delete : ${data.messages.length}",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.amberAccent,
                            textColor: Colors.white,
                            fontSize: 12.0
                          );
                    }
                },
              child: const Text('Click to delete push notifications from your inbox'),
            )
          ],
        ),
      )
    );
  }
}