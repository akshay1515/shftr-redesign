import 'package:flutter/material.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(top:100.0, left: 12.0 ,right: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Candidates",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            Text(
              "Available Applicants",
              style: TextStyle(
                color: Colors.black,
                fontSize: FontConstant.Tagline_text,
              ),
            ),
            UserSwipeCards(),
          ],
        ),
      ),
    );
  }
}
