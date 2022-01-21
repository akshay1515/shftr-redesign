import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/widgets/homepage/jobs-sub-list.dart';

class Joblistitem extends StatelessWidget {
  const Joblistitem({
    Key? key,
    required this.index,
    required this.size,
  }) : super(key: key);

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subcategory Name $index",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  fontFamily: "Poppins"),
            ),
            Row(children: [
              Text("Swipe Mode",style: TextStyle(color: Colors.grey.shade500),),
              SizedBox(width: 3,),
              Icon(Icons.swipe_rounded,color: Colors.grey.shade500)
            ],)
          ],
        ),
        Container(
          height: 325,
          width: size.width,
          margin: EdgeInsets.only(bottom: 20,top: 8),
          child: JobsbySubCategory(),
        )
      ],
    );
  }
}

