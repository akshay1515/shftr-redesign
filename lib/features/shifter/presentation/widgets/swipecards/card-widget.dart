import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/provider/userswipecardprovider.dart';
import 'package:shifter/utils/fontconstant.dart';

class CardWidget extends StatefulWidget {
  final String urlImage;
  final bool onDisplay;

  const CardWidget({Key? key, required this.urlImage, required this.onDisplay})
      : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: widget.onDisplay ? DisplayCard() : JobCard(),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;

      final provider =
          Provider.of<UserSwipeCardProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
  }

  Widget JobCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        elevation: 2,
        shadowColor: Colors.grey,
        child: Container(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      //  image: NetworkImage(widget.urlImage, ),
                      image: AssetImage(
                          "assets/images/logo.png"),
                        fit: BoxFit.cover,
                        alignment: Alignment(-0.3, 0)
                    ),
                  ),
                ),
              ),
              Center(
                child:  Text(
                  "Rodman Test-account",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Chef",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: FontConstant.Tagline_text,
                      fontFamily: 'Poppins'
                  ),
                ),
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
                      "",
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
              SizedBox(height: 10.0,),
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
              Container(
                width: 280,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Hospitality Professional dedicated to progressive continued success.",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: FontConstant.Tagline_text,
                          fontFamily: 'Poppins'
                      ),
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
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.black ,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child:   Center(
                          child: Text(
                            "View Resume",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.black ,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child:   Center(
                          child: Text(
                            "View Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Swipe right to accept candidate and left to reject",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                        fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget DisplayCard() {
    return GestureDetector(
      child: LayoutBuilder(builder: (context, constraints) {
        final cardProvider = Provider.of<UserSwipeCardProvider>(context);
        final position = cardProvider.position;
        final angle = cardProvider.angle * pi / 100;
        final center = constraints.smallest.center(Offset.zero);

        final rotated = Matrix4.identity()
          ..translate(center.dx, center.dy)
          ..rotateZ(angle)
          ..translate(-center.dx, -center.dy);

        return AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: cardProvider.isMoving ? 0 : 400),
            transform: rotated..translate(position.dx, position.dy),
            child: Stack(
              children: [JobCard(), StatusStamps()],
            ));
      }),
      onPanStart: (details) {
        final provider =
            Provider.of<UserSwipeCardProvider>(context, listen: false);
        provider.startPosition(details);
      },
      onPanUpdate: (details) {
        final provider =
            Provider.of<UserSwipeCardProvider>(context, listen: false);
        provider.updatePosition(details);
      },
      onPanEnd: (details) {
        final provider =
            Provider.of<UserSwipeCardProvider>(context, listen: false);
        provider.endPosition();
      },
    );
  }

  /*Widget DisplayJob(){}*/

  Widget StatusStamps() {
    final provider = Provider.of<UserSwipeCardProvider>(context);
    final status = provider.getStatus();
    final opacity = provider.getStatusOpacity();

    switch (status) {
      case Jobstatus.accepted:
        final child = buildMessage(
            color: Colors.green, text: "Accept", angle: -0.5, opacity: opacity);
        return Positioned(top: 64, left: 50, child: child);
      case Jobstatus.rejected:
        final child = buildMessage(
            color: Colors.red, text: "Reject", angle: 0.5, opacity: opacity);
        return Positioned(top: 64, right: 50, child: child);
      case Jobstatus.saved:
        final child = Center(
            child: buildMessage(
                color: Colors.amber.shade700,
                text: "Save",
                angle: -0.5,
                opacity: opacity));
        return Positioned(bottom: 128, right: 0, left: 0, child: child);
      default:
        return Container();
    }
  }

  Widget buildMessage(
      {required Color color,
      required String text,
      double angle = 0,
      required double opacity}) {
    return Opacity(
      opacity: opacity,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color, width: 3)),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: color,
                fontSize: 30,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
