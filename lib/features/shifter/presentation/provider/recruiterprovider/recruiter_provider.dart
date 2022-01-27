import 'dart:async';
import 'dart:convert' as convert;
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class RecruiterProvider extends ChangeNotifier{

  RecruiterModel? recruiterModel;
  sendRecruiterData(context, id) async{
    recruiterModel = await getRecruiterDetails( context, id);
    notifyListeners();
  }

  Future getRecruiterDetails( BuildContext context, String id,) async {
    final String url = "https://demo.shifterteam.host/v1/getRecruiter.php";
    var dataInput = {"id": "1"};
    final msg = convert.jsonEncode(dataInput);

    try {
      final response = await http.post(Uri.parse(url),
        body: msg,
        headers: {"Content-type": "application/json", "Accept": "application/json"}
      );
      if(response.statusCode == 200){
        print(response.statusCode);
        print(response.body.toString());

        return RecruiterModel.fromJson(convert.json.decode(response.body));
      }else{

      }


    } on TimeoutException {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

}

// To parse this JSON data, do
//
//     final recruiter = recruiterFromJson(jsonString);

class RecruiterModel {
  RecruiterModel({
    required this.id,

  });

  final String? id;

  factory RecruiterModel.fromJson(Map<String, dynamic> json) => RecruiterModel(
    id: json["id"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,

  };
}

