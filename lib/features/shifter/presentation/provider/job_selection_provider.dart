
import 'package:flutter/widgets.dart';

class JobSelectionProvider with ChangeNotifier{
  String? jobSelected = '';
  String? selectedJobId = '';

  String? get selectedJob => jobSelected;
  String? get selectedJobID => selectedJobId;

  void updateSelectedJob(String? job) {
    jobSelected = job;

    notifyListeners();
  }

  void updateSelectedJobId(String? jobId) {
    selectedJobId = jobId;
    notifyListeners();
  }
}