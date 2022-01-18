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
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.urlImage),
              fit: BoxFit.cover,
              alignment: Alignment(-0.3, 0)),
        ),
      ),
    );
  }
  //
  // Widget JobCard() {
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(20),
  //     child: PhysicalModel(
  //         borderRadius: BorderRadius.circular(5.0),
  //         color: Colors.red,
  //         elevation: 2,
  //         shadowColor: Colors.grey,
  //       child:  Center(
  //         child: Padding(
  //           padding: const EdgeInsets.only(top: 10.0),
  //           child: Container(
  //             height: 200,
  //             width: 200,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(8.0),
  //               image: DecorationImage(
  //                   image: NetworkImage(widget.urlImage),
  //                   fit: BoxFit.cover,
  //                   alignment: Alignment(-0.3, 0)
  //               ),
  //             ),
  //             child: Column(children: [
  //               Center(
  //                 child: Text("Jane Doe", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
  //               ),
  //               Center(
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(18.0),
  //                   child:
  //                   Text("Candidate description, Lorem ipsum dolor sit amet,consectetur adipiscing elit, consectetur adipiscing elit, sed do eiusmod tempor,consectetur adipiscing elit, "
  //                     , maxLines: 3,
  //                     overflow: TextOverflow.ellipsis,
  //                     textAlign: TextAlign.center,
  //                     softWrap: false,
  //                     style: TextStyle(
  //                       fontSize: FontConstant.Mini_Tagline_text,
  //                       height: 1.5,
  //
  //                     ),),
  //                 ),
  //               ),
  //
  //             ],),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
