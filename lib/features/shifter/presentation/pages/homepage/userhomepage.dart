import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/pages/candidateactivity/local_candidate_page.dart';
import 'package:shifter/features/shifter/presentation/pages/locationactivity/location_activity.dart';
import 'package:shifter/features/shifter/presentation/provider/recruiterprovider/recruiter_provider.dart';
import 'package:shifter/features/shifter/presentation/widgets/swipecards/userswipecard.dart';
import 'package:shifter/utils/consants.dart';
import 'package:shifter/utils/fontconstant.dart';

class UserHomePage extends StatefulWidget {
  static const String Tag = "-/userhomepage";

  const UserHomePage({Key? key, this.id}) : super(key: key);
  final String? id;

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  bool _isLoading = false;
  CarouselController buttonCarouselController = CarouselController();
  List imgList = [1, 2, 3, 4, 5];
  int _currentIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  @override
  void initState() {
    Provider.of<RecruiterProvider>(context, listen: false)
        .sendRecruiterData(context, "2")
        .then((value) {
      setState(() {
        _isLoading = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final recruiterData = Provider.of<RecruiterProvider>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 415,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.9,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/img_home_back.png'),
                              fit: BoxFit.fill)),
                    ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              Constants.app_title,
                              style: TextStyle(
                                  fontSize: 27,
                                  fontFamily: "Pacifico",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Welcome !",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                   _isLoading ?  Text(
                                     "Test",
                                     style: TextStyle(
                                         fontSize: 26,
                                         fontFamily: "Poppins",
                                         fontWeight: FontWeight.w600,
                                         color: Colors.white),
                                     maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                   ) :  Text(
                                     "Test",
                                     style: TextStyle(
                                         fontSize: 26,
                                         fontFamily: "Poppins",
                                         fontWeight: FontWeight.w600,
                                         color: Colors.white),
                                     maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                   )
                                  ],
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                        color: Colors.white, width: 2.0),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/logo.png"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(LocationActivity.Tag);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "City Name",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down_circle,
                                    color: Colors.white,
                                    size: 18.0,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 200,
                        child: Column(
                          children: [
                            Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: ListView(
                                  children: [
                                    CarouselSlider.builder(
                                        carouselController:
                                            buttonCarouselController,
                                        itemCount: imgList.length,
                                        itemBuilder: (BuildContext context,
                                                int itemIndex,
                                                int pageViewIndex) =>
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                        options: CarouselOptions(
                                          height: 150.0,
                                          autoPlay: true,
                                          viewportFraction: 0.85,
                                          onPageChanged: (index, reason) {
                                            setState(
                                              () {
                                                _currentIndex = index;
                                              },
                                            );
                                          },
                                        ))
                                  ],
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imgList.map((urlOfItem) {
                                int index = imgList.indexOf(urlOfItem);
                                return Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentIndex == index
                                        ? Colors.amber.shade700
                                        : Color.fromRGBO(0, 0, 0, 0.6),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context)
                      .pushNamed(LocationActivity.Tag);
                },
                child: Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Job Category",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              "Tap here to change job category",
                              style: TextStyle(
                                color: Colors.black54,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Icon(
                            Icons.arrow_drop_down_circle,
                            color: Colors.black,
                            size: 22.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1, // Thickness
                color: Colors.grey.withOpacity(0.2),
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  height: 380,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Residential",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0
                        ),
                      ),
                      Container(
                        height: 338,
                        child: ListView(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(
                              top: 20.0,
                            ),
                            scrollDirection: Axis.horizontal,
                          children: [
                            //Replace with api
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                              child: GestureDetector(
                                onTap: (){},
                                child: PhysicalModel(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                  elevation: 2,
                                  shadowColor: Colors.grey,
                                  child: Container(
                                    width: 215,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.0),
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/logo.png"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Center(
                                          child: Text(
                                            "Candidate Name",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: FontConstant.Tagline_text
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            "Work as occupation name",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: FontConstant.Mini_Tagline_text
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: 5.0,),
                                        Center(
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.location_on_outlined, size: 18.0,),
                                              Text(
                                                "Candidate registered location" ,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: FontConstant.Mini_Tagline_text
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.0,),
                                        Padding(
                                          padding: const EdgeInsets.only(left:8.0, right: 8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 1, // Thickness
                                            color: Colors.grey.withOpacity(0.2),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Text("Candidate description, Lorem ipsum dolor sit amet,consectetur adipiscing elit, consectetur adipiscing elit, sed do eiusmod tempor,consectetur adipiscing elit, "
                                              , maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              softWrap: false,
                                              style: TextStyle(
                                                fontSize: FontConstant.Mini_Tagline_text,
                                                height: 1.5,

                                              ),),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:8.0, right: 8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 1, // Thickness
                                            color: Colors.grey.withOpacity(0.2),
                                          ),
                                        ),
                                        SizedBox(height: 8.0,),
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 8),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(context, PageTransition(
                                                  child: LocalCandidatePage(), type: PageTransitionType.bottomToTop));
                                            },
                                            child: Text(
                                              'View Profile',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8)),
                                              primary: Colors.black,
                                              //minimumSize: Size(size.width, 45)),
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                              child: GestureDetector(
                                onTap: (){},
                                child: PhysicalModel(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                  elevation: 2,
                                  shadowColor: Colors.grey,
                                  child: Container(
                                    width: 215,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.0),
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/logo.png"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Center(
                                          child: Text(
                                            "Candidate Name",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: FontConstant.Tagline_text
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            "Work as occupation name",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: FontConstant.Mini_Tagline_text
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: 5.0,),
                                        Center(
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.location_on_outlined, size: 18.0,),
                                              Text(
                                                "Candidate registered location" ,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: FontConstant.Mini_Tagline_text
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.0,),
                                        Padding(
                                          padding: const EdgeInsets.only(left:8.0, right: 8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 1, // Thickness
                                            color: Colors.grey.withOpacity(0.2),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child:
                                            Text("Candidate description, Lorem ipsum dolor sit amet,consectetur adipiscing elit, consectetur adipiscing elit, sed do eiusmod tempor,consectetur adipiscing elit, "
                                              , maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              softWrap: false,
                                              style: TextStyle(
                                                fontSize: FontConstant.Mini_Tagline_text,
                                                height: 1.5,

                                              ),),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:8.0, right: 8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 1, // Thickness
                                            color: Colors.grey.withOpacity(0.2),
                                          ),
                                        ),
                                        SizedBox(height: 8.0,),
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 8),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(context, PageTransition(
                                                  child: LocalCandidatePage(), type: PageTransitionType.bottomToTop));
                                            },
                                            child: Text(
                                              'View Profile',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8)),
                                              primary: Colors.black,
                                              //minimumSize: Size(size.width, 45)),
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                              child: GestureDetector(
                                onTap: (){},
                                child: PhysicalModel(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                  elevation: 2,
                                  shadowColor: Colors.grey,
                                  child: Container(
                                    width: 215,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.0),
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/logo.png"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Center(
                                          child: Text(
                                            "Candidate Name",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: FontConstant.Tagline_text
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            "Work as occupation name",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: FontConstant.Mini_Tagline_text
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: 5.0,),
                                        Center(
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.location_on_outlined, size: 18.0,),
                                              Text(
                                                "Candidate registered location" ,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: FontConstant.Mini_Tagline_text
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.0,),
                                        Padding(
                                          padding: const EdgeInsets.only(left:8.0, right: 8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 1, // Thickness
                                            color: Colors.grey.withOpacity(0.2),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Text("Candidate description, Lorem ipsum dolor sit amet,consectetur adipiscing elit, consectetur adipiscing elit, sed do eiusmod tempor,consectetur adipiscing elit, "
                                              , maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              softWrap: false,
                                              style: TextStyle(
                                                fontSize: FontConstant.Mini_Tagline_text,
                                                height: 1.5,

                                              ),),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:8.0, right: 8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 1, // Thickness
                                            color: Colors.grey.withOpacity(0.2),
                                          ),
                                        ),
                                        SizedBox(height: 8.0,),
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 8),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(context, PageTransition(
                                                  child: LocalCandidatePage(), type: PageTransitionType.bottomToTop));
                                            },
                                            child: Text(
                                              'View Profile',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8)),
                                              primary: Colors.black,
                                              //minimumSize: Size(size.width, 45)),
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
              SizedBox(height: 15.0,),
              Container(
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0,),
                      Text(
                        Constants.app_title,
                        style: TextStyle(
                            fontSize: 36,
                            fontFamily: "Pacifico",
                            fontWeight: FontWeight.w700,
                            color: Colors.grey),
                      ),
                      Text(" \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\"",
                      style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                )

              )
            ],

          ),
        ));
  }
}
