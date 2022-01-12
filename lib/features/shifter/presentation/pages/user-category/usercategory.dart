import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/pages/user-skill/userSkillSelect.dart';
import 'package:shifter/features/shifter/presentation/provider/jobcategoryprovider/jobcategoryprovider.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';
import 'package:shifter/utils/colorconstant.dart';

class UserCategory extends StatefulWidget {
  static const String Tag = "-/userCategory";

  const UserCategory({Key? key}) : super(key: key);

  @override
  State<UserCategory> createState() => _UserCategoryState();
}

class _UserCategoryState extends State<UserCategory> {
  FocusNode _searchFocus = FocusNode();
  bool _isLoading = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final subcategory = Provider.of<CategoryProvider>(context);

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
                  padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Select Upto 5 workprofiles',
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        'You can work in',
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
                          Provider.of<CategoryProvider>(context, listen: false)
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
                                top: 15, bottom: 10, left: 15, right: 15),
                            labelText: _searchFocus.hasFocus
                                ? "Search Jobs"
                                : "Search Jobs Here"),
                      ),
                      Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 70),
                            itemCount: subcategory.filteredCategoryList.length,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 0.75,
                                            style: BorderStyle.solid))),
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 8, bottom: 8),
                                      child: Text.rich(TextSpan(children: [
                                        TextSpan(
                                          text:
                                              '${subcategory.filteredCategoryList[index].subCategory} ',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                            text: subcategory
                                                .filteredCategoryList[index]
                                                .category,
                                            style: TextStyle(fontSize: 11))
                                      ])),
                                    ),
                                    Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          Provider.of<CategoryProvider>(context,
                                                  listen: false)
                                              .addSelected(subcategory
                                                  .filteredCategoryList[index]);
                                        },
                                        icon: subcategory.selectedList.contains(
                                                subcategory
                                                        .filteredCategoryList[
                                                    index])
                                            ? Icon(
                                                Icons.check_box_rounded,
                                                size: 25,
                                                color: Colors.amber.shade400,
                                              )
                                            : Icon(
                                                Icons
                                                    .check_box_outline_blank_rounded,
                                                size: 25,
                                                color: Colors.grey,
                                              ))
                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
                Visibility(
                    visible: !subcategory.selectedList.isEmpty,
                    child: Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 50, right: 50, bottom: 10),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(UserSkillSelect.Tag);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: ColorConstant.primary,
                                  fixedSize: Size(100, 45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Continue',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Poppins",
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.black87,
                                  )
                                ],
                              )),
                        )))
              ],
            ))
        : LoadingScreen();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false)
        .getSubCategory(context)
        .then((value) {
      setState(() {
        _isLoading = true;
      });
    });
  }
}
