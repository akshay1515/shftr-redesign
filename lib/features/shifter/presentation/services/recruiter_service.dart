import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shifter/features/shifter/presentation/provider/recruiterprovider/recruiter_provider.dart';

class RecruiterService{
static const String url = "https://demo.shifterteam.host/v1/getRecruiter.php";
static getRecruiter(String id, RecruiterProvider recruiterProvider)async{
  var dataInput = {'id': id};
  final msg = convert.jsonEncode(dataInput);
  bool result = false;
  await http.post(Uri.parse(url),
      headers: {"Content-type": "application/json", "Accept": "application/json"},
     body: msg,
      ).then((response){
        print('Response status: ${response.statusCode}');
        print('Resonse body: ${response.body}');

        if(response.statusCode == 200){
          print("Success");
          result = true;
          recruiterProvider.fetchRecruiter();

        }
  });
  return result;

}
  // Future getRecruiterDetails( BuildContext context, String id,) async {
  //   final
  //
  //   final msg = convert.jsonEncode(dataInput);
  //
  //   try {
  //     final response = await http.post(Uri.parse(url),
  //         body: msg,
  //         headers: {"Content-type": "application/json", "Accept": "application/json"}
  //     );
  //     if(response.statusCode == 200){
  //       print(response.statusCode);
  //       print(response.body.toString());
  //       return DataModel.fromJson(convert.json.decode(response.body));
  //     }else{
  //
  //     }
  //
  //
  //   } on TimeoutException {
  //     rethrow;
  //   } catch (error) {
  //     rethrow;
  //   }
  //   notifyListeners();
  // }
}