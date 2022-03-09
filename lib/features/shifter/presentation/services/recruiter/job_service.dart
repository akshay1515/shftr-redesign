
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shifter/features/shifter/presentation/models/recruiter/jobs.dart';


class JobService{
  static Future<List<Job>> getJob(String? recruiterId) async{
    String url = "https://demo.shifterteam.host/v1/getJobs.php";
    List<Job> jobList = [];
    final response = await http.post(Uri.parse(url),
      body: jsonEncode(<String, dynamic>{
        'id': recruiterId,
      }),

    );
    if(response.statusCode == 200){
      print(response.statusCode);
      print("Job Response: ${response.body}");

      final parsed = jsonDecode(response.body);
      for(var pack in parsed['data']){
        jobList.add(Job.fromJson(pack));
      }
      return jobList;
    }else{
      throw Exception('Failed to get jobs');
    }
  }
}