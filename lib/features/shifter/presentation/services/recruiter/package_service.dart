
import 'dart:convert';

import 'package:shifter/features/shifter/presentation/models/recruiter/packages.dart';
import 'package:http/http.dart' as http;

class PackageService{
 static Future<List<Package>> fetchPackage() async {
   List<Package> packageList = [];
   final response =
   await http.get(Uri.parse('https://demo.shifterteam.host/v1/getPackages.php'));

   if (response.statusCode == 200) {
     print("Success");
     print("Package Response: ${response.body}");
     // final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
     //
     // return parsed['data'].map<Package>((json) => Package.fromJson(json)).toList();
     final parsed = json.decode(response.body);
     for(var pack in parsed['data']){
       packageList.add(Package.fromJson(pack));
     }
     return packageList;
   } else {
     throw Exception('Failed to load album');
   }
 }
}