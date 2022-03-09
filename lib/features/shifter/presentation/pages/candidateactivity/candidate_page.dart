import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/models/recruiter/interested_job.dart';
import 'package:shifter/features/shifter/presentation/services/recruiter/interested_job_service.dart';
import 'package:shifter/features/shifter/presentation/widgets/swipecards/userswipecard.dart';
import 'package:shifter/utils/fontconstant.dart';

class CandidatePage extends StatefulWidget {
  const CandidatePage({Key? key}) : super(key: key);

  @override
  _CandidatePageState createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child : Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 12.0, right: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Candidates",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  fontSize: 22,
                ),
              ),
              Text(
                "Applied Candidates. Swipe right to accept and left to reject.",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: FontConstant.Tagline_text,
                  fontFamily: 'Poppins'
                ),
              ),
            SizedBox(height: 5.0,),
            Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade400 ,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child:   Center(
                child: Text(
                  "Dog Walker",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    fontSize: 12,
                  ),
                ),
              ),
            ),
             UserSwipeCards()
            ],
          ),
        ),
      ),
    );
  }
}
