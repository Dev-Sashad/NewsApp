import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/ui/screens/views/otherNews/otherNews.dart';
import 'package:newsapp/ui/widget/SideNavMenu/menuitem.dart';
import 'package:newsapp/utils/navigationbloc/navigation_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class SideBarpage extends StatefulWidget {
  @override
  SideBarpageState createState() => SideBarpageState();
}

class SideBarpageState extends State<SideBarpage>
    with SingleTickerProviderStateMixin<SideBarpage> {
  AnimationController _animationController;
  StreamController<bool> isCollapsedStreamController;
  Stream<bool> isCollapsedStream;
  StreamSink<bool> isCollapsedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isCollapsedStreamController = PublishSubject<bool>();
    isCollapsedStream = isCollapsedStreamController.stream;
    isCollapsedSink = isCollapsedStreamController.sink;
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    isCollapsedStreamController.close();
    isCollapsedSink.close();
  }

  void onIconpressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isCollapsedSink.add(false);
      _animationController.reverse();
    } else {
      isCollapsedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
        initialData: false,
        stream: isCollapsedStream,
        builder: (context, isCollapsedAsync) {
          return AnimatedPositioned(
              duration: _animationDuration,
              top: 0,
              bottom: 0,
              left: isCollapsedAsync.data ? -10 : -screenWidth,
              right: isCollapsedAsync.data ? 30 : screenWidth - 30,
              child: Row(children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  color: Colors.cyan[800],
                  child: Column(children: [
                    MenuItem(
                      image: "assets/logo.png",
                      title: 'Homepage',
                      onTap: () {
                        onIconpressed();
                       BlocProvider.of<NavigationBloc>(context)
                         .add(NavigationEvents.HomePageClickedEvent);
                       
                      },
                    ),
                    MenuItem(
                      image: "assets/bbc.png",
                      title: 'BBC',
                      onTap: () {
                        onIconpressed();
                         Navigator.push(context, MaterialPageRoute
                         (builder: (context) => OtherNewsView("& sources= bbc")));
                      },
                    ),
                    MenuItem(
                      image: "assets/cnn.png",
                      title: 'CNN',
                      onTap: () {
                        onIconpressed();
                          Navigator.push(context, MaterialPageRoute
                         (builder: (context) => OtherNewsView("& sources= cnn")));
                      },
                    ),
                    MenuItem(
                      image: "assets/tribune.png",
                      title: 'Nigerian Tribune',
                      onTap: () {
                        onIconpressed();
                          Navigator.push(context, MaterialPageRoute
                         (builder: (context) => OtherNewsView("&countries= ng &sources= tribune")));
                      },
                    ),
        
                    MenuItem(
                      image: "assets/leadership.png",
                      title: 'Leadership',
                      onTap: () {
                        onIconpressed();
                         Navigator.push(context, MaterialPageRoute
                         (builder: (context) => OtherNewsView("&countries= ng &sources= leadership"))); 
                      },
                    ),
                  ]),
                )),
                Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                        onTap: () {
                          onIconpressed();
                        },
                        child: ClipPath(
                            //  clipper: CustomMenuClipper(),
                            child: Container(
                          padding: isCollapsedAsync.data
                              ? EdgeInsets.fromLTRB(20, 0, 0, 15)
                              : EdgeInsets.fromLTRB(40, 0, 0, 15),
                          width: 60,
                          height: 110,
                          //  color: Colors.white,
                          alignment: Alignment.centerLeft,
                          child: AnimatedIcon(
                            color: Colors.cyan[800],
                            icon: AnimatedIcons.menu_close,
                            progress: _animationController.view,
                            size: 30,
                          ),
                        ))))
              ]));
        });
  }
}
