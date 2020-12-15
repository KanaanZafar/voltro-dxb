import 'package:voltro_dxb/utils/voltro_api_constants.dart';

class CasesModel {
  String originName;
  int totalCases,
      totalDeaths,
      newCases,
      newDeaths,
      newRecovered,
      totalRecovered;

  CasesModel(
      {this.originName,
      this.totalCases,
      this.totalDeaths,
      this.newCases,
      this.newDeaths,
      this.newRecovered,
      this.totalRecovered});

  CasesModel.fromMap(Map<String, dynamic> map) {
    this.originName = map[VoltroApiConstants.country] ?? "";
    this.totalCases = map[VoltroApiConstants.totalConfirmed];
    this.totalDeaths = map[VoltroApiConstants.totalDeaths];
    this.newCases = map[VoltroApiConstants.newConfirmed];
    this.newDeaths = map[VoltroApiConstants.newDeaths];
    this.newRecovered = map[VoltroApiConstants.newRecovered];
    this.totalRecovered = map[VoltroApiConstants.totalRecovered];
  }

  @override
  String toString() {
    return 'CasesModel{originName: $originName, totalCases: $totalCases, totalDeaths: $totalDeaths, newCases: $newCases, newDeaths: $newDeaths, newRecovered: $newRecovered, totalRecovered: $totalRecovered}';
  }
}
