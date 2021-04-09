
import 'package:demo1/styles/Texts.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Post extends ChangeNotifier {

 List routines = [];
  List title = [];
  List collect = [];

  void addToRoutine(String workout){
    if(!routines.contains(workout)){
      routines.add(workout);
      notifyListeners();
    }
  }

  void removeFromRoutine(String workout){
    routines.remove(workout);
    notifyListeners();
  }




 Future<void> submit(String one, List list) async {
   var url = 'http://localhost:3000/Identity$identity';
   await post(url, body: json.encode({'Name': one,"text": list}), headers: {'Content-type': 'application/json'});
     var response = await get(url);
     List data = jsonDecode(response.body);
     title.clear();
     collect.clear();
     data.forEach((element) {
       title.add(element['Name']);
       collect.add(element['text']);
     });
     print(collect);
     print(title);

 }

 Future<void> fetch(String url) async{
   var response = await get(url);
   List data = jsonDecode(response.body);
   title.clear();
   collect.clear();
   data.forEach((element) {
     title.add(element['Name']);
     collect.add(element['text']);
   });


 }





}


