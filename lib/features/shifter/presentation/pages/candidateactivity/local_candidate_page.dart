import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shifter/features/shifter/presentation/models/recruiter/jobs.dart';
import 'package:shifter/features/shifter/presentation/pages/locationactivity/location_activity.dart';
import 'package:shifter/features/shifter/presentation/services/recruiter/job_service.dart';

import 'package:shifter/utils/colorconstant.dart';
import 'package:shifter/utils/consants.dart';
import 'package:shifter/utils/fontconstant.dart';
import 'package:shimmer/shimmer.dart';

class LocalCandidatePage extends StatefulWidget {
  final String? recruiterId,
      candidateFirstName,
      candidateLastName,
      candidateJobTitle,
      candidateState,
      candidateCity,
      candidateExperience,
      candidateSSN,
      candidateQualification,
      candidateProfileImage,
      candidateAbout;

  const LocalCandidatePage(
      {Key? key,
      this.recruiterId,
      this.candidateFirstName,
      this.candidateLastName,
      this.candidateJobTitle,
      this.candidateState,
      this.candidateCity,
      this.candidateExperience,
      this.candidateProfileImage,
      this.candidateAbout,
      this.candidateSSN,
      this.candidateQualification})
      : super(key: key);

  @override
  _LocalCandidatePageState createState() => _LocalCandidatePageState();
}

class _LocalCandidatePageState extends State<LocalCandidatePage> {
  bool showAssignButton = false;
  late Future<List<Job>> futureJobs;
  ScrollController listScrollController = ScrollController();
  var selectedValue;

  @override
  void initState() {
    futureJobs = JobService.getJob(widget.recruiterId ?? "2");
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
                            image: widget.candidateProfileImage != null &&
                                    widget.candidateProfileImage != ""
                                ? NetworkImage(
                                    '${widget.candidateProfileImage}')
                                : AssetImage("assets/images/logo.png")
                                    as ImageProvider,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: Text(
                        "${widget.candidateFirstName} ${widget.candidateLastName}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    Center(
                      child: Text(
                        "${widget.candidateJobTitle}",
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
                            "${widget.candidateCity}, ${widget.candidateState}",
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
                                "${widget.candidateExperience}",
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
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${widget.candidateQualification}",
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
                        "${widget.candidateAbout}",
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
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Monday(7:00 AM - 6:30 PM)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0),
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
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Tuesday(7:00 AM - 6:30 PM)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0),
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
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Wednesday(7:00 AM - 6:30 PM)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0),
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
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Thursday(7:00 AM - 6:30 PM)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0),
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
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Friday(7:00 AM - 6:30 PM)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0),
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
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Saturday(7:00 AM - 6:30 PM)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0),
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
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Colors.white,
                enableDrag: true,
                context: context,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height/ 2,
                    child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setter){
                       return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 22.0, right: 15.0, top: 25.0),
                              child: SingleChildScrollView(
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
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text.rich(
                                        TextSpan(
                                          text: "Select job you want to assign to ",
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: '${widget.candidateFirstName}',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Poppins',
                                              ),
                                            )
                                          ],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Poppins',
                                              fontSize: FontConstant.Tagline_text),
                                        ),
                                      ),
                                    ),
                                    FutureBuilder<List<Job>>(
                                        future: futureJobs,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError) {
                                            return Center(
                                              child: Text("Error: ${snapshot.error}"),
                                            );
                                          } else if (snapshot.hasData) {
                                            return ListView.builder(
                                              shrinkWrap: true,
                                              controller: listScrollController,
                                              scrollDirection: Axis.vertical,
                                              itemCount: snapshot.data!.length,
                                              padding: EdgeInsets.zero,
                                              itemBuilder: (BuildContext context, int index) {
                                                return Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                        height: 90,
                                                        child: RadioListTile<String?>(
                                                          activeColor: Colors.orange,
                                                          value: snapshot.data![index].id,
                                                          groupValue: selectedValue,
                                                          onChanged: (String? value) async {
                                                            print(
                                                                "Value: $selectedValue");

                                                            setter(() {
                                                              selectedValue = value!;
                                                              showAssignButton = true;
                                                            });

                                                          },
                                                          title: Text(
                                                            "${snapshot.data![index].jobTitle}",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors.black,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                fontFamily: 'Poppins'),
                                                          ),
                                                          subtitle: Text(
                                                            "${snapshot.data![index].jobDescription}",
                                                            maxLines: 2,
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight:
                                                                FontWeight.w400,
                                                                fontFamily: 'Poppins',
                                                                fontSize: 11.0),
                                                          ),
                                                        ),
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
                                                    ]);
                                              },
                                            );
                                          } else if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return shimmerBuilder();
                                          } else if(!snapshot.hasData){
                                            return Center(
                                              child: Text("Please create a job in the job section", style:
                                              TextStyle(
                                                  color: Colors.black,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 11.0)),
                                            );
                                          }
                                          else {
                                            return Center(
                                              child: Text("Please create a job in the job section", style:
                                              TextStyle(
                                                  color: Colors.black,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 11.0)),
                                            );
                                          }
                                        }),

                                  ],
                                ),
                              ),
                            ),
                            showAssignButton ?
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //Do candidate job assign here
                                      Fluttertoast.showToast(
                                          msg: "Job assigned successful",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM, // Also possible "TOP" and "CENTER"
                                          backgroundColor: Colors.black54,
                                          textColor: Colors.white);
                                      // setter((){
                                      //   showErrorMessage(context: context, title: "Assigned successful", body: "${widget.candidateFirstName} will be notified. \n Thanks!", type: messageType.Success, buttonFunction: () {
                                      //     Navigator.of(context).pop();
                                      //   });
                                      // });
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Assign',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                        primary: ColorConstant.primary,
                                        minimumSize: Size(MediaQuery.of(context).size.width, 45)),
                                  ),
                                )
                            ) : Container(),
                          ],
                        );
                      },
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

  Widget shimmerBuilder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: MediaQuery.of(context)
            .size
            .width,
        height: 90,

      ),
    );
  }
}
