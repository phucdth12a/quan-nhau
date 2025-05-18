import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quan_nhau/app.dart';
import 'package:quan_nhau/extensions/datetime_extension.dart';
import 'package:quan_nhau/ui/home/page/home_page.dart';

class DetailInvitePage extends StatelessWidget {
  const DetailInvitePage({super.key, required this.data});

  static const path = '/detail_invite';
  static const name = 'detail_inviate';

  static GoRoute route() => GoRoute(
    path: path,
    name: name,
    builder:
        (context, state) => DetailInvitePage(data: state.extra as DemoData),
  );

  final DemoData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              'Lời Mời Nhậu Gần Bạn',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            SizedBox.shrink(),
            Text(
              data.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              data.des,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Row(
              spacing: 10,
              children: [
                Icon(Icons.timer, color: Color(0xFF79818e)),
                Text(
                  data.time.timeFormat,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                Icon(Icons.sticky_note_2_sharp, color: Color(0xFF79818e)),
                Text(
                  data.des,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                Icon(Icons.person, color: Color(0xFF79818e)),
                Text(
                  '${data.number} người',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?cb=iwp2&rs=1&pid=ImgDetMain',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                'ĐỒNG Ý',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
