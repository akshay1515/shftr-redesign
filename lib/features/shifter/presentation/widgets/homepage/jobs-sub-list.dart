import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/widgets/homepage/job-list-card.dart';


class JobsbySubCategory extends StatelessWidget {
  const JobsbySubCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, i) {
        return JobListCardWidget();
      },
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
    );
  }
}

