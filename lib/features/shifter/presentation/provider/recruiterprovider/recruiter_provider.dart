import 'dart:async';
import 'dart:convert' as convert;
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shifter/features/shifter/presentation/models/recruiter.dart';


class RecruiterProvider with ChangeNotifier{

  Recruiter _recruiter = Recruiter();

  fetchRecruiter(){
    return _recruiter;
  }





}



