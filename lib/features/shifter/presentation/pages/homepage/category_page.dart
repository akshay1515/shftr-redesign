import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shifter/features/shifter/presentation/models/recruiter/categories.dart';
import 'package:shifter/features/shifter/presentation/pages/homepage/userhomepage.dart';
import 'package:shifter/features/shifter/presentation/provider/categoryprovider/selected_category_provider.dart';
import 'package:shifter/features/shifter/presentation/services/recruiter/category_service.dart';
import 'package:shifter/features/shifter/presentation/widgets/bottom_navigation.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';
import 'package:shifter/utils/fontconstant.dart';

class CategoryPage extends StatefulWidget {
  final String? selectedCategoryId;
  const CategoryPage({Key? key, this.selectedCategoryId}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late Future<List<Category>> futureCategory;
  var selectedValue;

  @override
  void initState() {
    super.initState();
    futureCategory = CategoryService.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
      body: FutureBuilder<List<Category>>(
          future: futureCategory,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Category",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "Only jobs in the selected category will appear",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: FontConstant.Mini_Tagline_text,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RadioListTile<String?>(
                        activeColor: Colors.orange,
                        value: snapshot.data![index].id,
                        groupValue: selectedValue,
                        onChanged: (String? value) async{
                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("categoryName", snapshot.data![index].category.toString());
                          print("Selected Category: ${snapshot.data![index].category.toString()}");
                          setState(() {
                            selectedValue = value!;

                          });
                        },
                        title: Text("${snapshot.data![index].category}"),
                      );
                    },
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              LoadingScreen();
            } else {}
            return LoadingScreen();
          }),
      floatingActionButton: SizedBox(
          height: 48,
          width: MediaQuery.of(context).size.width,
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.orangeAccent,
            splashColor: Colors.black54,
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
            onPressed: () async{
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              print("Selected Category Id: $selectedValue");
              // final SharedPreferences prefs = await SharedPreferences.getInstance();
               prefs.setString("selectedCategoryID", selectedValue);
              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavScreen(catId: selectedValue, categoryName: prefsCategory,)));
              Navigator.pop(context);
            },
            child: Text(
              "Apply",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
