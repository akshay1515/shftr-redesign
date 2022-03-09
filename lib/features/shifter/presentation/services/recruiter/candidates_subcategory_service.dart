import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shifter/features/shifter/presentation/models/recruiter/CandidatesSubcategory.dart';
class SubcategoryService{

  static Future<List<CandidatesSubcategory>> getCandidateSubCat(String ?subCatId) async{
    String url = "https://demo.shifterteam.host/v1/getCandidateBySubCatID.php";
    List<CandidatesSubcategory> subcategoryList = [];
    final response = await http.post(Uri.parse(url),
      body: jsonEncode(<String, dynamic>{
        'subcat_id': subCatId,
      }),

    );
    if(response.statusCode == 200){
      print(response.statusCode);
      print("Get Candidates Response: ${response.body}");

      final parsed = jsonDecode(response.body);
      for(var pack in parsed['data']){
        subcategoryList.add(CandidatesSubcategory.fromJson(pack));
      }
      return subcategoryList;
    }else{
      throw Exception('Failed to get candidates');
    }
  }

}