import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpods/provider.dart';

class IdUserPage extends ConsumerWidget {
  final String id;
  IdUserPage({this.id = ''});

  @override
  Widget build(BuildContext context, watch) {
    final iduser = watch(detailIdUser(id));
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
          child: iduser.when(
              data: (data) => Text(data.name),
              loading: () => CircularProgressIndicator(),
              error: (e, s) => Text('$e'))),
    );
  }
}