import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voltro_dxb/models/cases_model.dart';
import 'package:voltro_dxb/utils/size_config.dart';
import 'package:voltro_dxb/utils/voltro_api_constants.dart';
import 'package:voltro_dxb/utils/voltro_colors.dart';
import 'package:voltro_dxb/utils/voltro_constants.dart';

const double CONTAINER_HEIGHT = 249;

class CasesDetailsScreen extends StatelessWidget {
  final CasesModel casesModel;

  CasesDetailsScreen({this.casesModel});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: CONTAINER_HEIGHT,
              width: SizeConfig.screenWidth,
              color: VoltroColors.voltroPrimaryColor,
              child: Stack(
                children: [
                  PositionedDirectional(
                    top: 15,

                    child: IconButton(
                      icon: SvgPicture.asset("assets/arrow_back.svg"),
                      padding: EdgeInsets.only(left: 15),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          casesModel.originName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: VoltroConstants.roboto),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          VoltroConstants.coronaStatsOverView,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: VoltroConstants.roboto,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Table(
              children: [
                TableRow(
                  children: [
                    requiredColumn(
                        heading: VoltroConstants.totalCases,
                        value: casesModel.totalCases),
                    requiredColumn(
                        heading: VoltroConstants.totalDeaths,
                        value: casesModel.totalDeaths)
                  ],
                ),
                TableRow(
                  children: [
                    requiredColumn(
                      heading: VoltroConstants.newCases,
                      value: casesModel.newCases,
                    ),
                    requiredColumn(
                        heading: VoltroConstants.newDeaths,
                        value: casesModel.newDeaths),
                  ],
                ),
                TableRow(
                  children: [
                    requiredColumn(
                        heading: VoltroConstants.newRecovered,
                        value: casesModel.newRecovered),
                    requiredColumn(
                        heading: VoltroConstants.totalRecovered,
                        value: casesModel.totalRecovered)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget requiredColumn({String heading, int value}) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
                fontSize: 10,
                fontFamily: VoltroConstants.roboto,
                fontWeight: FontWeight.w500,
                color: VoltroColors.textColorPrimary),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "$value",
            style: TextStyle(
                fontSize: 16,
                fontFamily: VoltroConstants.roboto,
                color: VoltroColors.textColorPrimary),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
