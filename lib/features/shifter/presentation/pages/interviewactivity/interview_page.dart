import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/pages/locationactivity/location_activity.dart';
import 'package:shifter/utils/fontconstant.dart';

class InterviewPage extends StatefulWidget {
  const InterviewPage({Key? key}) : super(key: key);

  @override
  _InterviewPageState createState() => _InterviewPageState();
}

class _InterviewPageState extends State<InterviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 12.0, right: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Interviews",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "Available Interviews for the job",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: FontConstant.Tagline_text,
                        fontFamily: 'Poppins'),
                  ),
                ],
              ),
              Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    // scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: PhysicalModel(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            elevation: 2,
                            shadowColor: Colors.grey,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 315,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:  AssetImage(
                                                    "assets/images/logo.png"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 225,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Rodman Test-account",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                  color: Colors.deepOrange,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "PENDING",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10.0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 1, // Thickness
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Text(
                                                "Job & Job Details",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              Text(
                                                "Dog Walker",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              Text(
                                                "Lorem ipsum dolor sit amet,consectetur adipiscing elit,consectetur adipiscing",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black54,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10.0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 1, // Thickness
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                ),
                                              ),
                                              Text(
                                                "Interview Details",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              Text(
                                                "21/1/2022, 4:20PM",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Poppins'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1, // Thickness
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            "CANCEL",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins',
                                                fontSize: 14),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            "COMPLETE",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins',
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
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
