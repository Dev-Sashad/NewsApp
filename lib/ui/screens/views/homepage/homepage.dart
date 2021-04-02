import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/ui/screens/views/dashboard/home.dart';
import 'package:newsapp/ui/screens/views/sideNav/sidebar.dart';
import 'package:newsapp/utils/navigationbloc/navigation_bloc.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  NavigationStates get initialState => Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(initialState),
        child: Stack(children: [
          BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationStates) {
            return navigationStates as Widget;
          }),
          SideBarpage(),
        ]),
      ),
    );
  }
}
