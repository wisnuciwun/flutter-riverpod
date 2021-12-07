import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpods/airweather.dart';
import 'package:learn_riverpods/changepage.dart';
import 'package:learn_riverpods/homepage.dart';
import 'package:learn_riverpods/id_user_page.dart';
import 'package:learn_riverpods/number_state_notifier.dart';

void main() {
  runApp(ProviderScope(child: MyApp())); //here must have
}

final myProvider = Provider<String>(
    (x) => 'Welcome !'); // constant provider
final myStateProvider = StateProvider<int>((x) => 0);
// final numberNotifierProvider = StateNotifierProvider<NumbersNotifier>((ref) {
//   return NumbersNotifier(); //to call state in other class
// });

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, watch) {
    return MaterialApp(
      title: 'learn riverpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final welcome = watch(myProvider);
    final nomer = watch(myStateProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('aaa'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // nomer.state++;
//           context.read(myStateProvider).state++;
//         },
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [Text(halo), Text(nomer.state.toString())],
//         ),
//       ),
//     );
//   }
// }

    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Riverpod'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          increment(context)
          // nomer.state++; //simple way but not recommended
          // context.read(myStateProvider).state++;
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Example Provider :"),
            Text(welcome),
            SizedBox(height: 20,),
            Text("State Provider :"),
            Text(nomer.state.toString()),
            TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
                child: Text('Consumer Widget')),
            TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangePage())),
                child: Text('Change Notifier Provider')),
            TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AirWeather())),
                child: Text('Future Provider')),
            TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IdUserPage(
                              id: '2',
                            ))),
                child: Text('Ke id user'))
          ],
        ),
      ),
    );
  }
}

void increment(BuildContext context) {
  //function can be like this
  context.read(myStateProvider).state++;
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Consumer(builder: (context, watch, child){
//           final myConsumer = watch(myProvider);
//           return Text(myConsumer);
//         }),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
