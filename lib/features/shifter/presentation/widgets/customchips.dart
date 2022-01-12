import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/provider/userskillprovider/userskillprovider.dart';

class CustomChips extends StatelessWidget {
  final Userskill userskills;

  const CustomChips({Key? key, required this.userskills}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userSkill = Provider.of<UserSkillProvider>(context);
    return InkWell(
      onTap: () {
        Provider.of<UserSkillProvider>(context, listen: false)
            .addSelected(userskills);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
        decoration: BoxDecoration(
            color: userSkill.allSelectedSkillList.contains(userskills)
                ? Colors.amber.shade400
                : Colors.white,
            border: Border.all(
                color: Colors.grey, style: BorderStyle.solid, width: 1),
            borderRadius: BorderRadius.circular(100)),
        child: !userSkill.allSelectedSkillList.contains(userskills)
            ? Text(
                userskills.name,
                softWrap: true,
                style: TextStyle(fontFamily: "Poppins",fontSize: 15),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(userskills.name,
                      softWrap: true, style: TextStyle(fontFamily: "Poppins",fontSize: 15)),
                  SizedBox(
                    width: 3,
                  ),
                  Transform.rotate(
                      angle: -math.pi / 4,
                      child: Icon(
                        Icons.add,
                        color: Colors.black87,
                      )),
                ],
              ),
      ),
    );
  }
}
