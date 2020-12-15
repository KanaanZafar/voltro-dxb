import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voltro_dxb/blocs/api_bloc/api_bloc.dart';
import 'package:voltro_dxb/helper/helper.dart';
import 'package:voltro_dxb/screens/home/home_screen.dart';
import 'package:voltro_dxb/screens/search/search_screen.dart';
import 'package:voltro_dxb/utils/voltro_colors.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int currentIndex = 0;
  ApiBloc apiBloc;
  List<Widget> pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiBloc = ApiBloc();
    apiBloc.add(FetchData());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 50,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            items: [
              getBottomNavBarItem(Item.Home),
              getBottomNavBarItem(Item.Search)
            ],
            onTap: (val) {
              setState(() {
                currentIndex = val;
              });
            },
            backgroundColor: VoltroColors.voltroPrimaryColor,
          ),
        ),
        body: BlocListener(
          bloc: apiBloc,
          listener: (ctx, blocState) {
            if (blocState is DataFetchedState) {
              pages = [
                HomeScreen(casesOfAllCountries: blocState.casesOfAllCountries),
                SearchScreen(
                  casesOfAllCountries: blocState.casesOfAllCountries,
                )
              ];
            }
          },
          child: BlocBuilder(
            bloc: apiBloc,
            builder: (ctx, state) {
              if (state is LoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        VoltroColors.voltroPrimaryColor),
                  ),
                );
              }
              if (state is NoDataFoundState) {
                return Container();
              }
              if (state is DataFetchedState) {
                return pages[currentIndex];
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem getBottomNavBarItem(Item item) {
    return BottomNavigationBarItem(
      title: Container(),
      icon: SvgPicture.asset(
        item.inactiveIcon,
        height: 17,
        width: 20,
        fit: BoxFit.cover,
      ),
      activeIcon: SvgPicture.asset(item.activeIcon),
    );
  }
}
/* Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Item.Home.activeIcon),
            ),
          ],
          onTap: (value) {},
        ),
      ) */
