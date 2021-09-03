import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangePage extends ConsumerWidget {
  const ChangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final number = watch(incrementProvider);
    final int anu = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Page'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => {context.read(incrementProvider).increment()},),
      body: Center(
          child: Text(anu.toString())),
    );
  }
}

class IncrementNotifier extends ChangeNotifier{
  int values = 200;
  int get v => values;

  void increment(){
    values += 1;
    notifyListeners();
  }
}

final incrementProvider = ChangeNotifierProvider((x) => IncrementNotifier());

// bedanya keliatan banget kalo udah diganti state


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ChangePage extends StatefulWidget {
//   const ChangePage({ Key? key }) : super(key: key);
//   @override
//   _ChangePageState createState() => _ChangePageState();
// }

// class _ChangePageState extends State<ChangePage> {
//   int a = 9;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Change Page'),
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: () => {
//         setState(() => {a += 1})
//       },),
//       body: Center(
//           child: Text(a.toString())),
//     );
//   }
// }
