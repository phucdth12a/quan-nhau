import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quan_nhau/extensions/datetime_extension.dart';
import 'package:quan_nhau/ui/create_invite/page/create_invite_page.dart';
import 'package:quan_nhau/ui/detail_invite/page/detail_invite_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const path = '/home';
  static const name = 'home';

  static GoRoute route() => GoRoute(
    path: path,
    name: name,
    pageBuilder: (context, state) => NoTransitionPage(child: HomePage()),
  );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final listData = [
    DemoData(
      name: 'Quán 123',
      des: 'Nhậu chill, tám chuyện',
      time: DateTime(2025, 5, 18, 19, 30),
      number: 5,
      acceptNumber: 3,
    ),
    DemoData(
      name: 'Beer Life',
      des: 'Uống xả láng nào',
      time: DateTime(2025, 5, 18, 19, 0),
      number: 6,
      acceptNumber: 4,
    ),
    DemoData(
      name: 'Sunny BBQ',
      des: 'Thư giãn sau giờ làm',
      time: DateTime(2025, 5, 18, 18, 45),
      number: 4,
      acceptNumber: 2,
    ),
    DemoData(
      name: 'Lộ thiên quán',
      des: '1 2 3 zoooooo',
      time: DateTime(2025, 5, 18, 19, 45),
      number: 5,
      acceptNumber: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF292265),
      body: Column(
        children: [
          Container(
            height: 150,
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Uống Không?\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'App Kết Bạn Nhậu Real-time',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                color: Colors.white,
              ),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: Column(
                        spacing: 10,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(CreateInvitePage.name).then((
                                value,
                              ) {
                                if (value is DemoData) {
                                  setState(() {
                                    listData.add(value);
                                  });
                                }
                              });
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF447aee),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Icon(
                                    Icons.location_on_sharp,
                                    size: 28,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'TẠO LỜI MỜI NHẬU',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            'Nhập địa điểm, mô tả, số người',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF717d8a),
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Lời mời nhậu gần bạn',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(20, 9, 20, 40),
                    sliver: SliverList.separated(
                      itemCount: listData.length,
                      itemBuilder: (context, index) {
                        final item = listData[index];
                        return GestureDetector(
                          onTap: () {
                            context.pushNamed(
                              DetailInvitePage.name,
                              extra: item,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: Color(0xFFebebeb),
                              ),
                            ),
                            child: Row(
                              spacing: 10,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 5,
                                    children: [
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        item.des,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16,
                                          color: Color(0xFF464b51),
                                        ),
                                      ),
                                      Text(
                                        '${item.time.timeFormat} - ${item.acceptNumber}/${item.number} người',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16,
                                          color: Color(0xFF464b51),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFffe03f),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'ZÔ!',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder:
                          (context, index) => SizedBox(height: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DemoData {
  final String name;
  final String des;
  final int number;
  final int acceptNumber;
  final DateTime time;

  DemoData({
    required this.name,
    required this.des,
    required this.number,
    required this.acceptNumber,
    required this.time,
  });
}
