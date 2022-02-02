import 'package:flutter/material.dart';

class SubscriptionActivity extends StatefulWidget {
  const SubscriptionActivity({Key? key}) : super(key: key);

  @override
  _SubscriptionActivityState createState() => _SubscriptionActivityState();
}

class _SubscriptionActivityState extends State<SubscriptionActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.9,
                    color: Colors.black,
                  ),
                  Positioned(
                    top: 120,
                    left: 16,
                    // right: 100,
                    child: Container(
                      height: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Growth",
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Your Subscription Plan",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white60,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 250,
                              child: Text(
                                "Grow your team by selecting from a mobile workforce and make your process cool.",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white60,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "2 Days",
                      style: TextStyle(
                          color: Color(0xFF0c9ea9),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    Text(
                      "Days left to expiry date",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Poppins'),
                    ),
                    Text(
                      "You can renew and update after plan expire",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                          fontFamily: 'Poppins'),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "2022-01-12",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontFamily: 'Poppins'),
                            ),
                            Text(
                              "ACTIVATION DATE",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "2022-02-13",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontFamily: 'Poppins'),
                            ),
                            Text(
                              "EXPIRY DATE",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.grey.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, right: 2.0),
                                  child: Text(
                                    "\$",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontFamily: 'Pacifico'),
                                  ),
                                ),
                                Text(
                                  "4.00",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontFamily: 'Pacifico'),
                                ),
                              ],
                            ),
                            Text(
                              "Admin fee",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                  fontFamily: 'Poppins'),
                            ),
                            Container(
                              width: 150,
                              child: Text(
                                "The charge for admin, when your hire is completed",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, right: 2.0),
                                  child: Text(
                                    "\$",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontFamily: 'Pacifico'),
                                  ),
                                ),
                                Text(
                                  "4.00",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontFamily: 'Pacifico'),
                                ),
                              ],
                            ),
                            Text(
                              "Shifter fee",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                  fontFamily: 'Poppins'),
                            ),
                            Container(
                              width: 150,
                              child: Text(
                                "The charge per shifter, when hired",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                    fontFamily: 'Poppins'),
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
            SizedBox(height: 15.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Features",
                    style: TextStyle(color: Colors.black87,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                    ),
                    Text("Plan features",
                      style: TextStyle(color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.redAccent,
                              radius: 4.0,
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          Container(
                            width: 310,
                            child: Text("Growth is a good package for recruiters who want to high level shifters",
                              style: TextStyle(color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1, // Thickness
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.redAccent,
                                radius: 4.0,
                              ),
                            ),
                            SizedBox(width: 5.0,),
                            Container(
                              width: 310,
                              child: Text("Growth is a good package for recruiters who want to high level shifters",
                                style: TextStyle(color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1, // Thickness
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.redAccent,
                                radius: 4.0,
                              ),
                            ),
                            SizedBox(width: 5.0,),
                            Container(
                              width: 310,
                              child: Text("Growth is a good package for recruiters who want to high level shifters",
                                style: TextStyle(color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1, // Thickness
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
