import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/widgets/custom_input.dart';
import 'package:shifter/utils/colorconstant.dart';
import 'package:shifter/utils/fontconstant.dart';
class UpdateCompanyActivity extends StatefulWidget {
  const UpdateCompanyActivity({Key? key}) : super(key: key);

  @override
  _UpdateCompanyActivityState createState() => _UpdateCompanyActivityState();
}

class _UpdateCompanyActivityState extends State<UpdateCompanyActivity> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:12.0, top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                      "Company Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "Update your company profile",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: FontConstant.Tagline_text,
                          fontFamily: 'Poppins'),
                    ),
                  ],),
                ),
            Column(
              children: [
                CustomInput(
                  labelText: "Company Name",
                ),
                CustomInput(
                  labelText: "Company Slogan",
                ),
                CustomInput(
                  labelText: "Company Size",
                ),
                CustomInput(
                  labelText: "Founded",
                ),
                CustomInput(
                  labelText: "Location",
                ),
                CustomInput(
                  labelText: "About Company",
                ),
                SizedBox(height: 10.0,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: ColorConstant.primary,
                        minimumSize: Size(size.width, 45)),
                  ),
                ),
              ],
            )
          ]),
        ));;
  }
}
