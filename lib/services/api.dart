import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  
  static const baseUrl = 'http://localhost:2000/api/';

 static addProduct(Map pdata)async{
  var url = Uri.parse('${baseUrl}add_product');
    try {
      final res = await http.post(url,body:pdata);
      if (res.statusCode == 200) {
        log('statusCode ${res.statusCode}');
        var data = jsonDecode(res.body.toString());
        log(data);
      }else{
       log('statusCode ${res.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
 }

}