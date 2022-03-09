import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shifter/features/shifter/presentation/models/recruiter/CandidatesSubcategory.dart';
import 'package:shifter/features/shifter/presentation/models/recruiter/categories.dart';
import 'package:shifter/features/shifter/presentation/models/recruiter/recruiter.dart';
import 'package:shifter/features/shifter/presentation/pages/candidateactivity/local_candidate_page.dart';
import 'package:shifter/features/shifter/presentation/pages/homepage/category_page.dart';
import 'package:shifter/features/shifter/presentation/provider/recruiterprovider/recruiter_provider.dart';
import 'package:shifter/features/shifter/presentation/services/recruiter/candidates_subcategory_service.dart';
import 'package:shifter/features/shifter/presentation/services/recruiter/category_service.dart';
import 'package:shifter/features/shifter/presentation/view_models/recruiter/recruiter_view_model.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';
import 'package:shifter/utils/consants.dart';
import 'package:shifter/utils/fontconstant.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webview_flutter/webview_flutter.dart';


class UserHomePage extends StatefulWidget {
  const UserHomePage({
    Key? key,
    this.id,
    this.catId,
    this.categoryName
  }) : super(key: key);
  final String? id, catId, categoryName;

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

final List<String> imgList = [
  "https://shifterteam.host/shifterwebportal/assets/img/banner/1216202112260101_Shftr.banner_png_20211225_200909_0000.png",
  "https://shifterteam.host/shifterwebportal/assets/img/banner/2230202112260101_Assemble Your Team_png_20211225_202130_0000.png",
  "https://shifterteam.host/shifterwebportal/assets/img/banner/1216202112260101_Shftr.banner_png_20211225_200909_0000.png"
];

class _UserHomePageState extends State<UserHomePage> {
  RecruiterViewModel? recruiterViewModel;
  bool _isLoading = false;
  CarouselController buttonCarouselController = CarouselController();
  int _currentIndex = 0;
  String? id;
  String? name;
  SharedPreferences? preferences;

  late Future<List<CandidatesSubcategory>> futureCandidates;
  late Future<List<Category>> futureCategory;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    // BannersProvider bannersProvider =
    // Provider.of<BannersProvider>(context, listen: false);

    setState(() {

      _isLoading = true;

    });
    getId();
    getSelectedCategoryName();

    futureCandidates =
        SubcategoryService.getCandidateSubCat( id ?? "6");
    futureCategory = CategoryService.fetchCategories();

    super.initState();
  }

  Future<String> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String selectedCategoryID =
        prefs.getString("selectedCategoryID") ?? "";
    return selectedCategoryID;
  }
  Future<String> getSelectedCategoryName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String selectedCategoryName =
        prefs.getString("categoryName") ?? "";

    // getSelectedCategoryName().then((value) {
    //   setState(() {
    //     name = value;
    //   });
    // });
    return selectedCategoryName;
  }

  @override
  Widget build(BuildContext context) {
    Recruiter? recruiter = Provider.of<RecruiterProvider>(context).recruiter;
    futureCandidates =
        SubcategoryService.getCandidateSubCat( id ?? "6");
    Widget launchWebView (){
    return  Container(
          width: double.infinity,
          height: 600,
          child: WebView(
            initialUrl: 'https://shftr.app/',
            // enable Javascript on WebView
            javascriptMode: JavascriptMode.unrestricted,
          )
      );
    }
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: GestureDetector(
                    onTap: () {
                      launchWebView();
                    },
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ))
        .toList();
    return _isLoading
        ? Scaffold(
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
                                image: AssetImage(
                                    'assets/images/img_home_back.png'),
                                fit: BoxFit.fill)),
                      ),
                      Positioned(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 12.0),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Welcome",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      _isLoading
                                          ? Text(
                                              "${recruiter?.name}",
                                              style: TextStyle(
                                                  fontSize: 26,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          : Text(
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
                                  // Container(
                                  //   height: 80,
                                  //   width: 80,
                                  //   decoration: BoxDecoration(
                                  //     borderRadius:
                                  //     BorderRadius.circular(
                                  //         8.0),
                                  //     border: Border.all(
                                  //         color: Colors.white,
                                  //         width: 2.0),
                                  //     image: DecorationImage(
                                  //       image: AssetImage(
                                  //           "assets/images/logo.png"),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      "${recruiter?.city} ${recruiter?.state}",
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
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                      height: 160.0,
                                      autoPlay: true,
                                      viewportFraction: 0.85,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      }),
                                  items: imageSliders,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: imgList.map((urlOfItem) {
                                  int index = imgList.indexOf(urlOfItem);
                                  return Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.0),
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
                          ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    // String selectedCategoryID =
                    //     prefs.getString("selectedCategoryID") ?? "";
                    getId().then((value) {
                      setState(() {
                        id = value;
                      });
                    });
                    print("Preference category id: $id");
                    Navigator.push(
                            context,
                            PageTransition(
                                child: CategoryPage(
                                  selectedCategoryId: id,
                                ),
                                type: PageTransitionType.bottomToTop))
                        .then((_) => setState(() {}));
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
                                    fontSize: 16.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
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
                SizedBox(
                  height: 10.0,
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
                  child: Container(
                    height: 380,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${name ?? "Available Candidates"}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        FutureBuilder<dynamic>(
                            future:
                                Future.wait([
                                  futureCandidates,
                                  futureCategory]),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text("Error: ${snapshot.error}"),
                                );
                              } else if (snapshot.hasData) {
                                return Container(
                                  height: 338,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.only(
                                      top: 20.0,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data![0].length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, bottom: 10.0),
                                        child: PhysicalModel(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: snapshot.data![0][index].userProfileImage != null && snapshot.data![0][index].userProfileImage != "" ?
                                                        NetworkImage('${snapshot.data![0][index].userProfileImage}') :
                                                        AssetImage(
                                                            "assets/images/logo.png") as ImageProvider,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Center(
                                                  child: Text(
                                                    "${snapshot.data![0][index].userFirstName} ${snapshot.data![0][index].userLastName }",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: FontConstant
                                                            .Tagline_text),
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    "${snapshot.data![0][index].userJobTitle}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: FontConstant
                                                            .Mini_Tagline_text),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .location_on_outlined,
                                                        size: 18.0,
                                                      ),
                                                      Text(
                                                        "${snapshot.data![0][index].city}, ${snapshot.data![0][index].state}",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: FontConstant
                                                                .Mini_Tagline_text),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0,
                                                          right: 8.0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 1, // Thickness
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                  ),
                                                ),
                                                Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            18.0),
                                                    child: Text(
                                                      "${snapshot.data![0][index].about}",
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                        fontSize: FontConstant
                                                            .Mini_Tagline_text,
                                                        height: 1.5,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0,
                                                          right: 8.0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 1, // Thickness
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.0,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 8),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          PageTransition(
                                                              child:
                                                                  LocalCandidatePage(
                                                                    recruiterId: recruiter?.id,
                                                                    candidateFirstName: snapshot.data![0][index].userFirstName ,
                                                                    candidateLastName: snapshot.data![0][index].userLastName ,
                                                                    candidateJobTitle: snapshot.data![0][index].userJobTitle ,
                                                                    candidateCity: snapshot.data![0][index].city,
                                                                    candidateState: snapshot.data![0][index].state,
                                                                    candidateProfileImage: snapshot.data![0][index].userProfileImage,
                                                                    candidateExperience: snapshot.data![0][index].exeLevel,
                                                                    candidateQualification: snapshot.data![0][index].qualification,
                                                                    candidateSSN: snapshot.data![0][index].ssn,
                                                                    candidateAbout: snapshot.data![0][index].about,
                                                                  ),
                                                              type: PageTransitionType
                                                                  .bottomToTop));
                                                    },
                                                    child: Text(
                                                      'View Profile',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                      primary: Colors.black,
                                                      //minimumSize: Size(size.width, 45)),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                //await Future.delayed(Duration(seconds: 2),(){});
                                return shimmerBuilder();
                              } else {}
                              return LoadingScreen();
                            }),
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
                  height: 15.0,
                ),
                Container(
                    height: 210.0,
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
                    ))
              ],
            )))
        : LoadingScreen();
  }
  Widget shimmerBuilder(){
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 10.0, bottom: 10.0),
        child: PhysicalModel(
          borderRadius:
          BorderRadius.circular(5.0),
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
                      borderRadius:
                      BorderRadius.circular(
                          8.0),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/logo.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Center(
                  child: Container(
                    height: 20,
                    width: 100,
                  ),
                ),
                Center(
                  child: Container(
                    height: 20,
                    width: 100,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                      ),
                      Container(
                        height: 20,
                        width: 100,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0),
                  child: Container(
                    width:
                    MediaQuery.of(context)
                        .size
                        .width,
                    height: 1, // Thickness
                    color: Colors.grey
                        .withOpacity(0.2),
                  ),
                ),
                Center(
                  child: Padding(
                    padding:
                    const EdgeInsets.all(
                        18.0),
                    child: Container(
                      height: 50,
                      width: 120,
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0),
                  child: Container(
                    width:
                    MediaQuery.of(context)
                        .size
                        .width,
                    height: 1, // Thickness
                    color: Colors.grey
                        .withOpacity(0.2),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child:
                              LocalCandidatePage(),
                              type: PageTransitionType
                                  .bottomToTop));
                    },
                    child: Text(
                      'View Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight:
                          FontWeight.w600,
                          fontSize: 12),
                    ),
                    style: ElevatedButton
                        .styleFrom(
                      shape:
                      RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius
                              .circular(
                              8)),
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
    );
  }
}
