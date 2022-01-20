import 'package:flutter/material.dart';

class JobDetailsActivity extends StatefulWidget {
  const JobDetailsActivity({Key? key}) : super(key: key);

  @override
  _JobDetailsActivityState createState() => _JobDetailsActivityState();
}

class _JobDetailsActivityState extends State<JobDetailsActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "JOB_ID0001",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  "Job",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  "JOB CATEGORY",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  "Category Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.0,
                      fontFamily: 'Poppins'),
                ),
                SizedBox(height: 10.0),
                Text(
                  "DESCRIPTION",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      fontFamily: 'Poppins'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Text(
                    "Lorem ipsum dolor sit amet,consectetur adipiscing elit,consectetur adipiscingLorem ipsum dolor sit amet,consectetur adipiscing elit,consectetur adipiscing",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
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
                            SizedBox(
                              width: 120,
                            ),
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
                        SizedBox(
                          height: 15.0,
                        ),
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
                            SizedBox(
                              width: 95,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "JOB STATUS",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black54,
                                      fontFamily: 'Poppins'),
                                ),
                                Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Color(0xFF0c9ea9)),
                                  child: Center(
                                    child: Text(
                                      "Live",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "EXPERIENCE",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black54,
                                      fontFamily: 'Poppins'),
                                ),
                                Text(
                                  "1 - 2 Years",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'Poppins'),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "FRESHER ",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black54,
                                      fontFamily: 'Poppins'),
                                ),
                                Text(
                                  "yes",
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
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1, // Thickness
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Salary Details",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  "Job salary details are here",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      fontFamily: 'Poppins'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SALARY",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black54,
                              fontFamily: 'Poppins'),
                        ),
                        Text(
                          "1000",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SALARY TYPE",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black54,
                              fontFamily: 'Poppins'),
                        ),
                        Text(
                          "Hourly ",
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
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1, // Thickness
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Job Skills",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  "Skills you have added in this job",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      fontFamily: 'Poppins'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Color(0xFF0c9ea9),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                            child: Text(
                          "Skill 1",
                          style: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: 'Poppins'),
                        )),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color(0xFF0c9ea9),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                            child: Text(
                          "Skill 2",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            fontFamily: 'Poppins'
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1, // Thickness
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Working Details",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  "Working details are here",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      fontFamily: 'Poppins'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "WORKING DAYS",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black54,
                              fontFamily: 'Poppins'),
                        ),
                        Text(
                          "4 Days",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "WORKING SHIFT",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black54,
                              fontFamily: 'Poppins'),
                        ),
                        Text(
                          "OverNights",
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
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1, // Thickness
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
