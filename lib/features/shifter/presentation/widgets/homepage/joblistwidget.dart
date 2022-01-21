import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/widgets/homepage/job-list-widget.dart';

class Joblistwidget extends StatelessWidget {
  const Joblistwidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 7,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 10,right: 10),
      itemBuilder: (BuildContext context, index) {
        return Joblistitem(size: size,index: index,);
      },
    );
  }
}

