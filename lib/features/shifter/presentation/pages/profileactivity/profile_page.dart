import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shifter/features/shifter/presentation/pages/locationactivity/location_activity.dart';
import 'package:shifter/features/shifter/presentation/pages/profileactivity/subscriptionActivity/subscription_activity.dart';
import 'package:shifter/features/shifter/presentation/pages/profileactivity/updateProfileActivity/update_company_activity.dart';
import 'package:shifter/features/shifter/presentation/pages/profileactivity/updateProfileActivity/update_personal_activity.dart';
import 'package:shifter/features/shifter/presentation/pages/profileactivity/walletactivity/wallet_page.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 340,
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
                    top: 100.0,
                    left: MediaQuery.of(context).size.width / 2.5,
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border:
                                  Border.all(color: Colors.white, width: 2.0),
                              image: DecorationImage(
                                image: AssetImage("assets/images/logo.png"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 159.0,
                    left: MediaQuery.of(context).size.width / 1.8,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(LocationActivity.Tag);
                      },
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Color(0xFF0c9ea9),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 190,
                    left: MediaQuery.of(context).size.width / 3.5,
                    child: Text(
                      "Company Name",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  )
                ],
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, PageTransition(
                            child: UpdatePersonalActivity(), type: PageTransitionType.bottomToTop));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Update Personal Profile",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                            Text(
                              "Edit & Update information",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                  fontFamily: 'Poppins'),
                            ),
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
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, PageTransition(
                            child: UpdateCompanyActivity(), type: PageTransitionType.bottomToTop));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Company Profile",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                            Text(
                              "Edit & Update information",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                  fontFamily: 'Poppins'),
                            ),
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
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, PageTransition(
                            child: SubscriptionActivity(), type: PageTransitionType.bottomToTop));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Subscription Plan",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                            Text(
                              "Plan Details",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                  fontFamily: 'Poppins'),
                            ),
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
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LocationActivity.Tag);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Reviews",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                            Text(
                              "What users say about your company",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                  fontFamily: 'Poppins'),
                            ),
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
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(WalletPage.Tag);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Wallet",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                            Text(
                              "Your wallet",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                  fontFamily: 'Poppins'),
                            ),
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
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LocationActivity.Tag);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Help",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                            Text(
                              "Want help? Contact us",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                  fontFamily: 'Poppins'),
                            ),
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
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LocationActivity.Tag);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "FAQs",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                            Text(
                              "Frequently Asked Questions",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                  fontFamily: 'Poppins'),
                            ),
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
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LocationActivity.Tag);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "About Us",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                            Text(
                              "Our story",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                  fontFamily: 'Poppins'),
                            ),
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
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LocationActivity.Tag);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "SignOut",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ],
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
            Container(
              height: 100.0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "version: 1.0.5",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
