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
  //
  // Future<PlanFeatures> fetchPlanFeatures(int id) async {
  //   final response = await http.post(
  //     Uri.parse(url),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       'plan_id': id,
  //     }),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     // If the server did return a 201 CREATED response,
  //     // then parse the JSON.
  //     print(response.statusCode);
  //     print("Plan Features: ${response.body}");
  //     return PlanFeatures.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 201 CREATED response,
  //     // then throw an exception.
  //     throw Exception('Failed to create album.');
  //   }
  // }
  //  postPlanFeature(
  //     int planId,
  //    ) async {
  //   final Map<String, dynamic> registrationData = {
  //     "plan_id": planId,
  //   };
  //
  //   return await post(Uri.parse(url),
  //       body: json.encode(registrationData),
  //       headers: {'Content-Type': 'application/json'})
  //       .then(onValue)
  //       .catchError(onError);
  // }
  //
  // static Future<List<PlanFeatures>> onValue(Response response) async {
  //   var result;
  //   final Map<String, dynamic> responseData = json.decode(response.body);
  //
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     var userData = responseData['data'];
  //
  //     PlanFeatures authPlanFeature = PlanFeatures.fromJson(userData);
  //
  //     final List parsed = json.decode(response.body);
  //    List<PlanFeatures> list =  parsed.map<PlanFeatures>((json) => PlanFeatures.fromJson(json)).toList();
  //
  //
  //     Preferences().savePlan(authPlanFeature);
  //
  //
  //     result = {
  //       'status': true,
  //       'message': 'Successfully registered',
  //       'data': list
  //     };
  //   } else {
  //     print(response.body);
  //     result = {
  //       'status': false,
  //       'message': 'Registration failed',
  //       'data': responseData
  //     };
  //   }
  //
  //   return result;
  // }
  //
  // static onError(error) {
  //   print("the error is $error.detail");
  //   return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  // }
}