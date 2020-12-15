import 'package:flutter/material.dart';
import 'package:voltro_dxb/utils/size_config.dart';
import 'package:voltro_dxb/utils/voltro_colors.dart';

class ListTileBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: 1,
      color: VoltroColors.borderColor,
      width: SizeConfig.screenWidth,
    );
  }
}
