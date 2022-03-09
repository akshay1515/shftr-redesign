import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shifter/features/shifter/presentation/models/recruiter/interested_job.dart';

class InterestedJobService {

  static Future<Map<String, dynamic>> getInterestedJob(String userId) async {
    String url = "https://demo.shifterteam.host/v1/getIntrestedJob.php";
    var result;
    final response = await http.post(Uri.parse(url),
      body: jsonEncode(<String, dynamic>{
        'user_id': userId,
      }),
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      print("Get Interested Job Response: ${response.body}");

      final Map<String, dynamic> responseData = json.decode(response.body);
      var userData = responseData['data'];
      InterestedJob interestedJob = InterestedJob.fromJson(userData);

      result = {
        'status': true,
        'message': 'Successful',
        'data':interestedJob
      };
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
      throw Exception('Failed to get candidates');
    }
    return result;
  }


}


