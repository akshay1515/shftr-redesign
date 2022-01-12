import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/widgets/show-error-dialog.dart';

class BusinessProvider with ChangeNotifier{

  NAICEModel? _selected;

  NAICEModel? get selected=>_selected;

  String _companycity ='';

  String get companycity => _companycity;

  String _companystate ='';

  String get companystate => _companystate;


  selectNaice(NAICEModel mode){
    _selected = mode;
    notifyListeners();
  }

  Future getCityFromZip(String zipcode,BuildContext context) async {
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$zipcode&sensor=true&key=AIzaSyDM2ShuDIqQcqfmU_CpqfqnXDuUL1_lics';

    try {
      final response =
      await http.get(Uri.parse(url)).timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        Map decoded = jsonDecode(response.body);
        if(decoded["results"].length>0) {
          _companycity = decoded['results'][0]['formatted_address'];
          final _splitCity = _companycity.split(',');
          _companycity = _splitCity[0];
          final _stateMap = decoded['results'][0]['address_components'];
          for (int i = 0; i < _stateMap.length; i++) {
            if (_stateMap[i]['types'].contains("administrative_area_level_1")) {
              _companystate =
              decoded['results'][0]['address_components'][i]['long_name'];
            }
          }
        }else{
          showErrorMessage(
              context: context,
              title: "Error",
              body: 'This pincode doesn\'t exist',
              type: messageType.Error,
              buttonFunction: () {
                Navigator.of(context).pop();
              });
        }
      }else{

      }
      notifyListeners();
    } on TimeoutException {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

}

class NAICEModel{
  final String Naicecategory;
  final int code;
  final String NAICE;

  NAICEModel({required this.Naicecategory,required this.code,required this.NAICE});
}