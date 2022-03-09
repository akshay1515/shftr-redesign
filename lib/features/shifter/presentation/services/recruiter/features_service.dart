import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shifter/features/shifter/presentation/models/recruiter/features.dart';
import 'package:shifter/utils/preferences/recruiter_preferences.dart';
class FeaturesService{
  
  static Future<List<Feature>> getFeatures(String planId) async{
    String url = "https://demo.shifterteam.host/v1/getPlanFeatures.php";
    List<Feature> featureList = [];
    final response = await http.post(Uri.parse(url),
        body: jsonEncode(<String, dynamic>{
              'plan_id': planId,
            }),

    );
    if(response.statusCode == 200){
      print(response.statusCode);
      print("Features Response: ${response.body}");

      final parsed = jsonDecode(response.body);
      for(var pack in parsed['data']){
        featureList.add(Feature.fromJson(pack));
      }
      return featureList;
    }else{
      throw Exception('Failed to get features');
    }
  }

}