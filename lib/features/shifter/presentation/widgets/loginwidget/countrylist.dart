import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/provider/loginprovider/login_activity_provider.dart';

class CountriesList extends StatefulWidget {
  CountriesList({Key? key}) : super(key: key);

  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchFocus = FocusNode();

  @override
  void initState() {
    Provider.of<LoginProvider>(context, listen: false).searchCountry("");
  }

  @override
  Widget build(BuildContext context) {
    final countriesList = Provider.of<LoginProvider>(context);
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      child: Container(
        color: Colors.white.withOpacity(0.95),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                focusNode: _searchFocus,
                onTap: () {
                  FocusScope.of(context).requestFocus(_searchFocus);
                },
                controller: _searchController,
                onChanged: (value) {
                  Provider.of<LoginProvider>(context, listen: false)
                      .searchCountry(value);
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
                    labelText: "Search Country Here"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.47,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: countriesList.countryList.length,
                  itemBuilder: (_, index) {
                    return CountryWidget(
                      model: countriesList.countryList[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryWidget extends StatelessWidget {
  final CountryModel model;

  const CountryWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<LoginProvider>(context, listen: false).setCountry(model);
        Provider.of<LoginProvider>(context, listen: false).searchCountry('');
        Navigator.of(context).pop();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.grey.shade300,
                    style: BorderStyle.solid,
                    width: 0.75))),
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 3, bottom: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              model.cFlag,
              height: 40,
              width: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Center(
              child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 50,
                    minHeight: 25,
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Text(
                    model.cName,
                    softWrap: true,
                    maxLines: 2,
                  )),
            ),
            Spacer(),
            Center(
                child: Container(
              child: Text(model.cCode),
            )),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
