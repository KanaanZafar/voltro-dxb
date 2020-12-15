import 'dart:convert';

import 'package:http/http.dart';
import 'package:voltro_dxb/models/cases_model.dart';
import 'package:voltro_dxb/resources/global_cases.dart';
import 'package:voltro_dxb/utils/voltro_api_constants.dart';
import 'package:voltro_dxb/utils/voltro_constants.dart';

class Repository {
  Future<List<CasesModel>> fetchData() async {
    List<CasesModel> casesInAllCountries = List<CasesModel>();
    Response response = await get(VoltroApiConstants.baseUrl);
    Map map = json.decode(response.body);
    Map globalData = map[VoltroApiConstants.global];
    GlobalCasesModel.globalCasesModel = CasesModel.fromMap(globalData);
    GlobalCasesModel.globalCasesModel.originName = VoltroConstants.world;
    List list = map[VoltroApiConstants.countries];
    list.forEach((element) {
      CasesModel countryCases = CasesModel.fromMap(element);
      casesInAllCountries.add(countryCases);
    });
    return casesInAllCountries;
  }
}
