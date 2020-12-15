import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voltro_dxb/components/country_list_tile.dart';
import 'package:voltro_dxb/models/cases_model.dart';
import 'package:voltro_dxb/utils/voltro_colors.dart';
import 'package:voltro_dxb/utils/voltro_constants.dart';

class SearchScreen extends StatefulWidget {
  final List<CasesModel> casesOfAllCountries;

  SearchScreen({this.casesOfAllCountries});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  OutlineInputBorder textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.transparent));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                fillColor: VoltroColors.textFieldColor,
                filled: true,
                border: textFieldBorder,
                disabledBorder: textFieldBorder,
                errorBorder: textFieldBorder,
                focusedBorder: textFieldBorder,
                enabledBorder: textFieldBorder,
                focusedErrorBorder: textFieldBorder,
                prefixIcon: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SvgPicture.asset(
                    "assets/search_dark.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: VoltroColors.textColorSecondary,
                  fontFamily: VoltroConstants.roboto,
                  fontSize: 16,
                ),
              ),
              onChanged: (val) {
                setState(() {});
              },
              onSubmitted: (val) {
                setState(() {});
              },
            ),
          ),
          searchController.text.isNotEmpty
              ? Column(
                  children: List<Widget>.generate(
                      widget.casesOfAllCountries.length, (index) {
                    CasesModel casesModel = widget.casesOfAllCountries[index];

                    if (casesModel.originName
                        .toLowerCase()
                        .startsWith(searchController.text.toLowerCase())) {
                      return CountryListTile(countryCases: casesModel);
                    }
                    return Container();
                  }),
                )
              : Container()
        ]),
      ),
    );
  }
}
