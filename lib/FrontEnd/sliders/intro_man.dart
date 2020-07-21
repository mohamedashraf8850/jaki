import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'intro_one.dart';
import 'intro_three.dart';
import 'intro_two.dart';


class MainPage extends StatefulWidget {
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<MainPage> {
  static PageController controller =
      new PageController(initialPage: 1, keepPage: false);
  static List<Widget> pages = [FirstPage(), SecondPage(), ThirdPage()];
  static int page = 1;
  PageView pageView = new PageView(
    onPageChanged: (pageNumber) {
      page = pageNumber;
      print('PageNumber:' + pageNumber.toString());
    },
    scrollDirection: Axis.horizontal,
    controller: controller,
    children: pages,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
            color: Colors.grey[200],
            child: Stack(
              children: <Widget>[
               Align(
                    child: PageIndicatorContainer(
                  pageView: pageView,
                  align: IndicatorAlign.bottom,
                  length: 3,
                  indicatorSpace: 10.0,
                  // padding: EdgeInsets.fromLTRB(10, 0, 10, 100),
                  indicatorColor: Colors.white,
                  indicatorSelectorColor: Colors.black,
                  shape: IndicatorShape.circle(size: 12),
                )),
                
              ],
            )));
  }
}
