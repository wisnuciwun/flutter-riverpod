import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final cuaca = watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
          child: cuaca.when(
              data: (data) => Text(data),
              loading: () => CircularProgressIndicator(),
              error: (e, s) => Text('$e'))),
    );
  }
}

Future<String> getWeather() async {
  await Future.delayed(Duration(seconds: 2));
  return '28 Celcius';
}

final futureProvider = FutureProvider<String>((x) => getWeather());
