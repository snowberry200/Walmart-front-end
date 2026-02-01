import 'package:flutter/material.dart';

class OthersInfos extends StatelessWidget {
  const OthersInfos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isSmallScreen = width <= 670;
    bool isMediumScreen = width > 670 && width < 1200;
    // bool isLargeScreen = _width > 1200;
    return isSmallScreen
        ? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Privacy & Security',
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 13),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('CA Privacy Rights',
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 13)),
                SizedBox(
                  height: 10,
                ),
                Text('Do Not Sell My Personal Information',
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 13)),
                SizedBox(
                  height: 10,
                ),
                Text('Request My Personal Information',
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 13)),
                SizedBox(
                  height: 10,
                ),
                Text('Help',
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 13)),
                SizedBox(
                  height: 10,
                ),
                Text('Terms of Use',
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 13)),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '©2022 Walmart. All Rights Reserved.',
                      style: TextStyle(fontSize: 10),
                    ))
              ],
            ),
          )
        : SingleChildScrollView(
            scrollDirection: isMediumScreen ? Axis.horizontal : Axis.vertical,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Privacy & Security',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 13,
                            letterSpacing: 1.4),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('CA Privacy Rights',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 13,
                              letterSpacing: 1.4)),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Do Not Sell My Personal Information',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 13,
                              letterSpacing: 1.4)),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Request My Personal Information',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 13,
                              letterSpacing: 1.4)),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Help',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 13,
                              letterSpacing: 1.4)),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Terms of Use',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 13,
                              letterSpacing: 1.4)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '©2022 Walmart. All Rights Reserved.',
                        style: TextStyle(fontSize: 10),
                      )),
                ],
              ),
            ),
          );
  }
}
