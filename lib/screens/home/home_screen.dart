import 'package:flutter/material.dart';
import 'package:voltro_dxb/components/country_list_tile.dart';
import 'package:voltro_dxb/models/cases_model.dart';
import 'package:voltro_dxb/resources/global_cases.dart';
import 'package:voltro_dxb/utils/voltro_constants.dart';

class HomeScreen extends StatefulWidget {
  final List<CasesModel> casesOfAllCountries;

  HomeScreen({@required this.casesOfAllCountries});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  GlobalCasesModel.globalCasesModel.originName.toUpperCase(),
                  style: TextStyle(
                      fontFamily: VoltroConstants.roboto,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  GlobalCasesModel.globalCasesModel.totalCases.toString(),
                  style: TextStyle(
                      fontFamily: VoltroConstants.roboto,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          Column(
            children: List<Widget>.generate(widget.casesOfAllCountries.length,
                (index) {
              CasesModel countryCases = widget.casesOfAllCountries[index];
              return CountryListTile(countryCases: countryCases);
            }),
          ),
        ],
      )),
    );
  }
}
