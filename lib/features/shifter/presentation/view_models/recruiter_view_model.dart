import 'package:shifter/features/shifter/presentation/models/recruiter.dart';

class RecruiterViewModel{
  late Recruiter _recruiter;

  setRecruiter(Recruiter recruiter){
    _recruiter = recruiter;
  }

  Recruiter get recruiter =>_recruiter;
}