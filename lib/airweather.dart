import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpods/provider.dart';

class AirWeather extends ConsumerWidget {
  const AirWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final cuaca = watch(airData);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: RefreshIndicator(
        onRefresh: () => context.refresh(airData),
        child: ListView(children: [
          Center(
              child: cuaca.when(
                  data: (data) => Text(data.data.country.toString()),
                  loading: () => CircularProgressIndicator(),
                  error: (e, s) => Text('$e'))),
        ]),
      ),
    );
  }
}

// Future<String> getWeather() async {
//   await Future.delayed(Duration(seconds: 2));
//   return '28 Celcius';
// }

// final futureProvider = FutureProvider<String>((x) => getWeather());
