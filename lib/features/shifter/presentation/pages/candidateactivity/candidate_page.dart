import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/widgets/swipecards/userswipecard.dart';
import 'package:shifter/utils/fontconstant.dart';

class CandidatePage extends StatefulWidget {
  const CandidatePage({Key? key}) : super(key: key);

  @override
  _CandidatePageState createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {
  List<String> tinderStyleImages = [
    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
  ];

  @override
  Widget build(BuildContext context) {
    // List<Widget> cards = List.generate(
    //   tinderStyleImages.length,
    //   (int index) {
    //     return Container(
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(16.0),
    //         boxShadow: [
    //           BoxShadow(
    //             offset: Offset(0, 17),
    //             blurRadius: 23.0,
    //             spreadRadius: -13.0,
    //             color: Colors.black54,
    //           )
    //         ],
    //       ),
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.circular(16.0),
    //         child: Image.network(
    //           tinderStyleImages[index],
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     );
    //   },
    // );
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
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
              "Available Applicants",
              style: TextStyle(
                color: Colors.black54,
                fontSize: FontConstant.Tagline_text,
                fontFamily: 'Poppins'
              ),
            ),
            //
           UserSwipeCards()
          ],
        ),
      ),
    );
  }
}
