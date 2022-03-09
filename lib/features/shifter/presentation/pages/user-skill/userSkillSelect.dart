import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/pages/homepage/userhomepage.dart';
import 'package:shifter/features/shifter/presentation/provider/userskillprovider/userskillprovider.dart';
import 'package:shifter/features/shifter/presentation/widgets/customchips.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';
import 'package:shifter/utils/colorconstant.dart';

class UserSkillSelect extends StatefulWidget {
  static const String Tag = '-/userskillselect';

  const UserSkillSelect({Key? key}) : super(key: key);

  @override
  _UserSkillSelectState createState() => _UserSkillSelectState();
}



class _UserSkillSelectState extends State<UserSkillSelect> {
  FocusNode _searchFocus = FocusNode();
  bool _isLoading = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _userskill = Provider.of<UserSkillProvider>(context);
    return _isLoading
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_rounded),
                color: Colors.black87,
              ),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Select Upto 10 Skills',
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        'You can work with',
                        style: TextStyle(
                            fontFamily: "Poppins", color: Colors.black87),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        focusNode: _searchFocus,
                        onTap: () {
                          FocusScope.of(context).requestFocus(_searchFocus);
                        },
                        controller: _searchController,
                        onChanged: (value) {
                          Provider.of<UserSkillProvider>(context, listen: false)
                              .searchCategory(value);
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                                color: _searchFocus.hasFocus
                                    ? Colors.amber.shade700
                                    : Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade700,
                                  style: BorderStyle.solid,
                                  width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.amber.shade700,
                                  style: BorderStyle.solid,
                                  width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.only(
                                top: 15, bottom: 10, left: 15, right: 10),
                            labelText: _searchFocus.hasFocus
                                ? "Search Skills"
                                : "Search Skills Here"),
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 70),
                            child: Wrap(
                              children: _userskill.allSkillFilteredList
                                  .map((e) => CustomChips(
                                        userskills: e,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                    visible: _userskill.allSelectedSkillList.isNotEmpty,
                    child:  Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: EdgeInsets.only(left: 50,right: 50,bottom: 10),
                          child: ElevatedButton(
                              onPressed: () {

                                //Navigator.of(context).push(UserHomePage());
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: ColorConstant.primary,
                                  fixedSize: Size(100,45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Continue',style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Poppins",
                                    fontStyle: FontStyle.normal,
                                  ),),
                                  SizedBox(width: 15,),
                                  Icon(Icons.arrow_forward_rounded,color: Colors.black87,)
                                ],
                              )),
                        )))
              ],
            ))
        : LoadingScreen();
  }

  @override
  void initState() {
    Provider.of<UserSkillProvider>(context, listen: false)
        .getAllSkill()
        .then((value) {
      setState(() {
        _isLoading = true;
      });
    });
  }
}
