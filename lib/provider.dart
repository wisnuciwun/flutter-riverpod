import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpods/apimodel.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  // final urlApi = http://api.airvisual.com/v2/city?city=Jakarta&state=Jakarta&country=Indonesia&key=c3031bf8-d25f-425c-bdd0-0c8cd19989e4;
  final keyApi = 'c3031bf8-d25f-425c-bdd0-0c8cd19989e4';

  Future<Apimodel> fetchweather() async {
    final resp = await http.get(Uri.parse('http://api.airvisual.com/v2/city?city=Jakarta&state=Jakarta&country=Indonesia&key=c3031bf8-d25f-425c-bdd0-0c8cd19989e4'));
    
    if(resp.statusCode == 200)
    {
      var res = json.decode(resp.body);
      print(res);
      return Apimodel.fromJson(res);
    } else {
      throw Exception('No data');
    }
  }
}


final airData = FutureProvider<Apimodel>((ref){
  final api = ref.watch(apiProvider);
  return api.fetchweather();
  
});

final apiProvider = Provider((x) => ApiRepository());
