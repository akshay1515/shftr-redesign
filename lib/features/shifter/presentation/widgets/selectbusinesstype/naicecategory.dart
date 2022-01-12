import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/pages/signupactivity/businessregister.dart';
import 'package:shifter/features/shifter/presentation/provider/businessprovider/businessprovider.dart';
import 'dart:math' as math;
import 'package:shifter/features/shifter/presentation/provider/loginprovider/login_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/widgets/loadingscreen.dart';

class NAICECategory extends StatefulWidget {
  static const String Tag = '-/Naice';

  const NAICECategory({Key? key}) : super(key: key);

  @override
  _NAICECategoryState createState() => _NAICECategoryState();
}

List<String> _categoryTitle = [];
List<List> _categoryItems = [];
bool _isLoading = false;

class _NAICECategoryState extends State<NAICECategory> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    _categoryItems.forEach((element) {
      element.forEach((value) {
        value.toString();
      });
    });
    return _isLoading
        ? Scaffold(
      backgroundColor: Colors.amber.shade600,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber.shade600,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Select your business category"),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: Transform.rotate(
              angle: math.pi / 2,
              child: Icon(Icons.arrow_forward_ios_rounded)))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15)),
        ),
        child: ListView.builder(
            itemCount: _categoryTitle.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _categoryItems[index].length,
                  itemBuilder: (_, i) {
                    return Card(
                      child: Center(
                        child: ListTile(
                          onTap: () {
                            Provider.of<BusinessProvider>(
                                context, listen: false).selectNaice(NAICEModel(
                                Naicecategory: _categoryTitle[index],
                                code:  _categoryItems[index][i]["code"],
                                NAICE:  _categoryItems[index][i]["subcategory"]));
                          Navigator.of(context).pop();
                            },
                          style: ListTileStyle.drawer,
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _categoryItems[index][i]["code"].toString(),
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    fontFamily: "Poppins"),
                              ),
                            ],
                          ),
                          title: Text(
                            _categoryItems[index][i]["subcategory"],
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: "Poppins"),
                          ),
                          subtitle: Text(
                            _categoryTitle[index],
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 10,
                                fontFamily: "Poppins"),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          isThreeLine: false,
                        ),
                      ),
                    );
                  });
              /*return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width,
                          padding: EdgeInsets.only(left: 10, right: 10,top: 5,bottom: 3),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: Colors.blueGrey,
                              width: 0.75,
                              style: BorderStyle.solid
                            ),top: BorderSide(
                                color: Colors.blueGrey,
                                width: 0.75,
                                style: BorderStyle.solid
                            ))
                          ),
                          child: Text(_categoryTitle[index],style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              height: 1.2,
                              fontSize: 18
                          ),),
                        ),
                        ListView.builder(
                          padding: EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                            shrinkWrap: true,
                            itemCount: _categoryItems[index].length,
                            itemBuilder: (_, i) {
                              return IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(_categoryItems[index][i]["code"]
                                        .toString()),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child:
                                      ),
                                    )],
                                ),
                              );
                            })
                      ],
                    );*/
            }),
      ),
    )
        : LoadingScreen();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<LoginProvider>(context, listen: false)
        .getNAICECategory()
        .then((value) {
      value!.forEach((key, value) {
        _categoryItems.add(value);
        _categoryTitle.add(key);
        setState(() {
          _isLoading = true;
        });
      });
    });
  }
}

