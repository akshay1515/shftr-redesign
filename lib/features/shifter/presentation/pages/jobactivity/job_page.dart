import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shifter/features/shifter/presentation/pages/jobactivity/job_details_activity.dart';
import 'package:shifter/features/shifter/presentation/pages/locationactivity/location_activity.dart';
import 'package:shifter/utils/fontconstant.dart';

class JobPage extends StatefulWidget {
  const JobPage({Key? key}) : super(key: key);

  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 12.0, right: 12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Posted Jobs",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        "Your posted jobs",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: FontConstant.Tagline_text,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context)
                          .pushNamed(LocationActivity.Tag);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics:const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    // scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, PageTransition(
                                child: JobDetailsActivity(), type: PageTransitionType.bottomToTop));
                          },
                          child: PhysicalModel(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            elevation: 2,
                            shadowColor: Colors.grey,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 320,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: Container(
                                        height: 30,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF0c9ea9),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Live",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: FontConstant.Tagline_text,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:AssetImage(
                                                  "assets/images/logo.png")
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5.0,),
                                        Container(
                                          width: 225,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Dog Walker",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                "DESCRIPTION",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              Text(
                                                "Lorem ipsum dolor sit amet,consectetur adipiscing elit,consectetur adipiscing",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54,
                                                    fontFamily: 'Poppins'),
                                              )
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1, // Thickness
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                  ),

                                  SizedBox(height: 10.0,),
                                  Container(
                                    height: 110,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "OPENINGS",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black54,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                  Text(
                                                    "1",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 120,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "JOB TYPE",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black54,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                  Text(
                                                    "Full Time",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.0,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "POSTED DATE",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black54,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                  Text(
                                                    "2022-01-18",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 95,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "LOCATION",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black54,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                  Text(
                                                    "Nairobi, Kenya",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 56,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(8.0),
                                          bottomLeft: Radius.circular(8.0),
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.of(context)
                                                  .pushNamed(LocationActivity.Tag);
                                            },
                                            child: Text("CANDIDATES",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontFamily: 'Poppins'),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.of(context)
                                                  .pushNamed(LocationActivity.Tag);
                                            },
                                            child: Text("CLOSE JOB",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.redAccent,
                                                  fontFamily: 'Poppins'),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
