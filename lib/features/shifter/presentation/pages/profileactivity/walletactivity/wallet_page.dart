import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  static const String Tag = '-/wallet';

  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            // controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 24,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Your Cards",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                  color: Colors.black),
                            ),
                            Text(
                              "2 Physical Card, and 1 Virtual Card",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.more_horiz,
                      //     color: Colors.lightBlue[900],
                      //     size: 30,
                      //   ),
                      //   onPressed: () {},
                      // )
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),

                SizedBox(
                  height: 16,
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    children: <Widget>[
                      //copy same button
                      Container(
                        child: Text(
                          "Physical Card",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.grey[900]),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  blurRadius: 10.0,
                                  spreadRadius: 4.5)
                            ]),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),

                      SizedBox(
                        width: 16,
                      ),

                      Container(
                        child: Text(
                          "Virtual Card",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.grey[900]),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  blurRadius: 10.0,
                                  spreadRadius: 4.5)
                            ]),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ],
                  ),
                ),

                //Container for card
                SizedBox(
                  height: 16,
                ),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(35, 60, 103, 1),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Color.fromRGBO(50, 172, 121, 1),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            Text(
                              "VISA",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          "**** **** **** 5647",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "CARD HOLDER",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue[100],
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2.0),
                                ),
                                Text(
                                  "John Doe",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[100],
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2.0),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "EXPIRES",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue[100],
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2.0),
                                ),
                                Text(
                                  "8/22",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[100],
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2.0),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "CVV",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue[100],
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2.0),
                                ),
                                Text(
                                  "***",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[100],
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2.0),
                                ),

                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Center(child: Text("Tap to update", style: TextStyle(color: Colors.white, fontSize: 10),)),

                      ],
                    )),

                SizedBox(
                  height: 10,
                ),

                Container(
                  child: Text(
                    "Card Settings",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32),
                ),

                SizedBox(
                  height: 16,
                ),

                // Container(
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Colors.grey.shade100,
                //             spreadRadius: 10.0,
                //             blurRadius: 4.5)
                //       ]),
                //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                //   margin: EdgeInsets.symmetric(horizontal: 32),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       Row(
                //         children: <Widget>[
                //           Icon(
                //             Icons.wifi_tethering,
                //             color: Colors.lightBlue[900],
                //           ),
                //           SizedBox(
                //             width: 16,
                //           ),
                //           Text(
                //             "Card Settings",
                //             style: TextStyle(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 18,
                //                 color: Colors.grey[700]),
                //           )
                //         ],
                //       ),
                //       Switch(
                //         value: true,
                //         activeColor: Color.fromRGBO(50, 172, 121, 1),
                //         onChanged: (_) {},
                //       )
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 16,
                // ),
                //
                // Container(
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Colors.grey.shade100,
                //             spreadRadius: 10.0,
                //             blurRadius: 4.5)
                //       ]),
                //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                //   margin: EdgeInsets.symmetric(horizontal: 32),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       Row(
                //         children: <Widget>[
                //           Icon(
                //             Icons.credit_card,
                //             color: Colors.lightBlue[900],
                //           ),
                //           SizedBox(
                //             width: 16,
                //           ),
                //           Text(
                //             "Online Payment",
                //             style: TextStyle(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 18,
                //                 color: Colors.grey[700]),
                //           )
                //         ],
                //       ),
                //       Switch(
                //         value: true,
                //         activeColor: Color.fromRGBO(50, 172, 121, 1),
                //         onChanged: (_) {},
                //       )
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 16,
                // ),
                //
                // Container(
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Colors.grey.shade100,
                //             spreadRadius: 10.0,
                //             blurRadius: 4.5)
                //       ]),
                //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                //   margin: EdgeInsets.symmetric(horizontal: 32),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       Row(
                //         children: <Widget>[
                //           Icon(
                //             Icons.mobile_screen_share,
                //             color: Colors.lightBlue[900],
                //           ),
                //           SizedBox(
                //             width: 16,
                //           ),
                //           Text(
                //             "ATM Withdraws",
                //             style: TextStyle(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 18,
                //                 color: Colors.grey[700]),
                //           )
                //         ],
                //       ),
                //       Switch(
                //         value: true,
                //         activeColor: Color.fromRGBO(50, 172, 121, 1),
                //         onChanged: (_) {},
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Color.fromRGBO(243, 245, 248, 1),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40))),
        ),
      ),
    );
  }
}
