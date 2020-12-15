import 'package:flutter/material.dart';
import 'package:voltro_dxb/components/listtile_border.dart';
import 'package:voltro_dxb/models/cases_model.dart';
import 'package:voltro_dxb/screens/cases_details_screen.dart';
import 'package:voltro_dxb/utils/voltro_colors.dart';
import 'package:voltro_dxb/utils/voltro_constants.dart';

class CountryListTile extends StatelessWidget {
  final CasesModel countryCases;

  CountryListTile({@required this.countryCases});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => CasesDetailsScreen(
              casesModel: countryCases,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ListTileBorder(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  countryCases.originName,
                  style: TextStyle(
                    fontFamily: VoltroConstants.roboto,
                    color: VoltroColors.textColorPrimary,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${countryCases.totalCases}",
                  style: TextStyle(
                      fontFamily: VoltroConstants.roboto,
                      color: VoltroColors.textColorPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
