import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shifter/features/shifter/presentation/pages/locationactivity/location_activity.dart';
import 'package:shifter/features/shifter/presentation/widgets/customchips.dart';
import 'package:shifter/utils/colorconstant.dart';
import 'package:shifter/utils/consants.dart';
import 'package:shifter/utils/fontconstant.dart';

class LocalCandidatePage extends StatefulWidget {
  const LocalCandidatePage({Key? key}) : super(key: key);

  @override
  _LocalCandidatePageState createState() => _LocalCandidatePageState();
}

class _LocalCandidatePageState extends State<LocalCandidatePage> {
   String _site = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    Center(
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                        "assets/images/logo.png"),
                            // image: NetworkImage(
                            //   'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                            // ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: Text(
                        "Ben Trem",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Freelancer",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                            fontSize: FontConstant.Tagline_text),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 18.0,
                          ),
                          Text(
                            "Rochester, NY",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                                fontSize: FontConstant.Mini_Tagline_text),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1, // Thickness
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Entry Level",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              ),
                              Text(
                                "EXPERIENCE LEVEL",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54,
                                    fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "12th",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              ),
                              Text(
                                "QUALIFICATION",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54,
                                    fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1, // Thickness
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Work Experience",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                      Text(
                        "Candidate's work experience",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: FontConstant.Mini_Tagline_text),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "No Experience",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "User",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                    fontSize: FontConstant.Mini_Tagline_text),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "has no experience",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                    fontSize: FontConstant.Mini_Tagline_text),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300, // Thickness
                color: Colors.grey.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rating & Review",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 280,
                            child: Text(
                              "Here is a complete review and rating of candidate",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                  fontSize: FontConstant.Mini_Tagline_text),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(LocationActivity.Tag);
                              },
                              child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins'),
                                  ),
                                  Text(
                                    "Overall Ratting",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: 'Poppins'),
                                  ),
                                  Container(
                                    width: 140,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "It is overall ratting of",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54,
                                              fontFamily: 'Poppins'),
                                        ),
                                        Text(
                                          "candidate",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54,
                                              fontFamily: 'Poppins'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Container(
                                  width: 1,
                                  height: 100, // Thickness
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins'),
                                  ),
                                  Text(
                                    "All Review",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: 'Poppins'),
                                  ),
                                  Container(
                                    width: 140,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "It is overall review of",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54,
                                              fontFamily: 'Poppins'),
                                        ),
                                        Text(
                                          "candidate",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54,
                                              fontFamily: 'Poppins'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 90.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Key Skills",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                      Text(
                        "Candidate's work skills",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: FontConstant.Mini_Tagline_text),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1, // Thickness
                color: Colors.grey.withOpacity(0.2),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "About Candidate",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                      Text(
                        "What candidate says about him/her self",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: FontConstant.Mini_Tagline_text),
                      ),
                      Text(
                        "about me about me about me about me about meabout me about me about me about me about meabout me about me about me about me about meabout me about me about me about me about meabout me about me about me about me about meabout me about me about about me about me",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: FontConstant.Tagline_text),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1, // Thickness
                color: Colors.grey.withOpacity(0.2),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 360.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Available Days",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                      Text(
                        "Free days of candidates",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: FontConstant.Mini_Tagline_text),
                      ),
                      Container(
                        height: 270,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Monday(7:00 AM - 6:30 PM)",
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Tuesday(7:00 AM - 6:30 PM)",
                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Wednesday(7:00 AM - 6:30 PM)",
                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Thursday(7:00 AM - 6:30 PM)",
                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Friday(7:00 AM - 6:30 PM)",
                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(20.0)
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Saturday(7:00 AM - 6:30 PM)",
                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ),
                      SizedBox(
                        height: 20.0,
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          Constants.app_title,
                          style: TextStyle(
                              fontSize: 36,
                              fontFamily: "Pacifico",
                              fontWeight: FontWeight.w700,
                              color: Colors.grey),
                        ),
                        Text(
                          " \"Developing a good work ethic is key. Apply yourself at whatever you do, whether you're a janitor or taking your "
                              "first summer job because that work ethic will be reflected in everything you do in your life.\"",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 48,
        width: MediaQuery.of(context).size.width,
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.orangeAccent,
          splashColor: Colors.black54,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Colors.white,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 22.0, right: 15.0, top: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Choose Job",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                            GestureDetector(
                              onTap: Navigator.of(context).pop,
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Image.asset(
                              "assets/images/myicons/cancel.png",
                              height: 20.0,
                            ),
                                ))
                          ],
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Which job do you want to hire a candidate ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                                fontSize: FontConstant.Tagline_text),
                          ),
                        ),

                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 90,
                                child: ElevatedButton(
                                  onPressed: () {

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {

                                              },
                                              child:
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:10.0),
                                                    child: Radio(
                                                      value: "",
                                                      activeColor: Colors.orange,

                                                      groupValue: _site,
                                                      onChanged: ( value) {
                                                        setState(() {

                                                        });
                                                      },
                                                    ),
                                                  )

                                            ),
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                           Text(
                                             "Driver",
                                             style: TextStyle(
                                                 fontSize: 14,
                                                 color: Colors.black,
                                                 fontWeight: FontWeight.bold,
                                                 fontFamily: 'Poppins'),
                                           ),
                                           Container(
                                             width: 240,
                                             height: 40,
                                             child: Text(
                                               "Lorem ipsum dolor sit amet,consectetur adipiscing elit,consectetur",
                                               maxLines: 2,
                                               overflow: TextOverflow.ellipsis,
                                               style: TextStyle(
                                                   color: Colors.black,
                                                   fontWeight: FontWeight.w400,
                                                   fontFamily: 'Poppins',
                                                   fontSize: 11.0),
                                             ),
                                           ),
                                         ],)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    primary: Colors.grey.withOpacity(0.4),
                                    alignment: Alignment.centerLeft,
                                    //minimumSize: Size(size.width, 45)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 1, // Thickness
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                            ]),
                      ],
                    ),
                  );
                });
          },
          child: Text(
            "SELECT JOB",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
