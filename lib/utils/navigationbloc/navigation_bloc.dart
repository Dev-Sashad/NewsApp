import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapp/ui/screens/views/dashboard/home.dart';

enum NavigationEvents {
  HomePageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> with ChangeNotifier {
  NavigationBloc(NavigationStates initialState) : super(initialState);
    String path;
  NavigationStates get initialState => Home();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield Home();
        break;
   
    }
  }
}
