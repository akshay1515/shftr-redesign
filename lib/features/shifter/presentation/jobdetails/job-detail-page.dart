import 'dart:math' as math;

import 'package:flutter/material.dart';

class JobDetailPage extends StatelessWidget {
  static const String Tag = "/jobdetailsPage";

  JobDetailPage({Key? key}) : super(key: key);

  List<String> skillset = [
    "Professional",
    "Timely",
    "Punctual",
    "Good Customer Service",
    "Polite"
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Job Title",
          style: TextStyle(
            color: Colors.black87,
            fontFamily: "Poppins",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black87,
            )),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Job Title",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                fontFamily: "Poppins"),
                          ),
                          Text(
                            "Job Category",
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Poppins"),
                          ),
                          Text(
                            "Company Name",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Transform(
                                  child: Icon(
                                    Icons.history_sharp,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  transform: Matrix4.rotationY(math.pi),
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Contract",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 0.75,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    "Job Location",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins"),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 20,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Work Location",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w300,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 0.75,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    "Job Description",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet felis elementum, finibus enim ac, consequat lectus. Fusce in arcu non urna iaculis luctus. Aenean a imperdiet elit, ac tristique nunc. Nam sagittis pharetra iaculis. Morbi quis nibh elit. In hac habitasse platea dictumst. Fusce magna est, accumsan in risus at, auctor vestibulum nulla. Nam interdum tincidunt varius. Proin vulputate egestas eros. Cras consequat odio et est sagittis condimentum at sit amet lacus.",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: size.width,
                  height: 75,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  color: Colors.grey.shade400.withOpacity(0.3),
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "10",
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: "Poppins",
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        )),
                    TextSpan(
                        text: " Positions to be filled",
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: "Poppins",
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        )),
                  ])),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    "Shifter Experience Range",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    "The candidate with above mentioned experience is required for current openings",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width,
                  height: 150,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  color: Colors.grey.shade400.withOpacity(0.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Payroll Details",
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Payroll details for this job is as",
                        style: TextStyle(
                            color: Colors.black54,
                            fontFamily: "Poppins",
                            fontSize: 13,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '\$',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                fontFamily: "Poppins")),
                        TextSpan(
                            text: " 20",
                            style: TextStyle(
                                color: Colors.black87,
                                fontFamily: "Poppins",
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "/ Contract",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: "Poppins"))
                      ])),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Skills Required",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Skills required for this job",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: skillset
                            .map((e) => Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.teal.shade500,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Divider(
                          color: Colors.grey,
                          thickness: 0.75,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Text(
                            "Shift details",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                fontFamily: "Poppins"),
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Text(
                            "Shift details are as below",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                                fontFamily: "Poppins"),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "4 Days",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Working",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: "Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Text(
                                  "7am - 4pm",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Working hours",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: "Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  width: size.width,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400.withOpacity(0.3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Job ID:",
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Poppins",
                            )),
                        TextSpan(
                            text: "  1982736450",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                            ))
                      ])),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Shftr",
                        style: TextStyle(
                            fontFamily: "Pacifico",
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade500.withOpacity(0.8)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "\"Developing good work ethics is key. Apply yourself at whatever you do.Wheather you're a janitor ot taking your first summer job because that work ethic will be reflectedin everything you do in life\"",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500.withOpacity(0.8)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.only(
                          top: 12, bottom: 12, left: 12, right: 12),
                      color: Colors.black87,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.work_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "See all jobs posted by (Company Name)"
                                .toUpperCase(),
                            style: TextStyle(
                              fontSize: 14,
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                            padding: EdgeInsets.only(
                                top: 12, bottom: 12, left: 5, right: 5),
                            color: Colors.green,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.work_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Apply to job"
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                            padding: EdgeInsets.only(
                                top: 12, bottom: 12, left: 5, right: 5),
                            color: Colors.amber,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.work_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Save job"
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                            padding: EdgeInsets.only(
                                top: 12, bottom: 12, left: 5, right: 5),
                            color: Colors.red,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.work_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Reject Job"
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
