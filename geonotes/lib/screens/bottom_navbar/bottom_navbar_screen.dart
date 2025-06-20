import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geonotes/screens/bottom_navbar/bloc/bottom_navbar_bloc.dart';
import 'package:geonotes/style/app_colors.dart';
import 'package:geonotes/utils/extensions/screen/screen_size.dart';

class BottomNavbarScreen extends StatelessWidget {
  const BottomNavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavbarBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<BottomNavbarBloc>();
          return BlocBuilder<BottomNavbarBloc, BottomNavbarState>(
            builder: (context, state) {
              double itemWidth = context.getWidth() / 3;

              return Stack(
                children: [
                  Scaffold(
                    body: bloc.screens[bloc.selectIndex],
                    bottomNavigationBar: NavigationBarTheme(
                      data: NavigationBarThemeData(
                        labelTextStyle: WidgetStateProperty.resolveWith((
                          states,
                        ) {
                          return TextStyle(
                            color: states.contains(WidgetState.selected)
                                ? Colors.grey[700]
                                : Colors.grey[500],
                          );
                        }),
                      ),
                      child: NavigationBar(
                        backgroundColor: Colors.white,
                        selectedIndex: bloc.selectIndex,
                        onDestinationSelected: (value) {
                          bloc.add(NavSelectionEvent(index: value));
                        },
                        indicatorColor: Colors.transparent,
                        destinations: [
                          NavigationDestination(
                            label: "List",
                            icon: Icon(Icons.list),
                          ),
                          NavigationDestination(
                            label: "Map",
                            icon: Icon(Icons.map),
                          ),
                          NavigationDestination(
                            label: "Profile",
                            icon: Icon(Icons.person),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 110,
                    left: itemWidth * bloc.selectIndex,
                    child: Container(
                      width: itemWidth,
                      height: 3,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
