import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quan_nhau/extensions/datetime_extension.dart';
import 'package:quan_nhau/ui/home/page/home_page.dart';

class CreateInvitePage extends StatefulWidget {
  const CreateInvitePage({super.key});

  static const path = '/create_invite';
  static const name = 'create_invite';

  static GoRoute route() => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => CreateInvitePage(),
  );

  @override
  State<CreateInvitePage> createState() => _CreateInvitePageState();
}

class _CreateInvitePageState extends State<CreateInvitePage> {
  final nameController = TextEditingController();
  final desController = TextEditingController();
  DateTime time = DateTime.now();
  final numberController = TextEditingController();

  bool canSubmit = false;

  void checkSubmit() {
    setState(() {
      canSubmit =
          nameController.text.trim().isNotEmpty &&
          desController.text.trim().isNotEmpty &&
          numberController.text.trim().isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              'Tạo Lời Mời Nhậu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Color(0xFFebebeb)),
              ),
              child: Row(
                spacing: 10,
                children: [
                  Icon(Icons.location_on_sharp, color: Color(0xFF79818e)),
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      onTapOutside: (event) {
                        final currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus &&
                            currentFocus.focusedChild != null) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.zero,
                        hintText: 'Nhập địa điểm',
                      ),
                      onChanged: (_) => checkSubmit(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Color(0xFFebebeb)),
              ),
              child: Row(
                spacing: 10,
                children: [
                  Icon(Icons.sticky_note_2_sharp, color: Color(0xFF79818e)),
                  Expanded(
                    child: TextField(
                      controller: desController,
                      onTapOutside: (event) {
                        final currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus &&
                            currentFocus.focusedChild != null) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.zero,
                        hintText: 'Nhập mô tả',
                      ),
                      onChanged: (_) => checkSubmit(),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(time),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      time = DateTime(
                        time.year,
                        time.month,
                        time.day,
                        value.hour,
                        value.minute,
                      );
                    });
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Color(0xFFebebeb)),
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.timer, color: Color(0xFF79818e)),
                    Spacer(),
                    Text(
                      time.timeFormat,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Color(0xFFebebeb)),
              ),
              child: Row(
                spacing: 10,
                children: [
                  Icon(Icons.person, color: Color(0xFF79818e)),
                  Text(
                    'Số người',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF89848c),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: numberController,
                      onTapOutside: (event) {
                        final currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus &&
                            currentFocus.focusedChild != null) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.zero,
                        hintText: '0',
                      ),
                      textAlign: TextAlign.right,
                      onChanged: (_) => checkSubmit(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: GestureDetector(
          onTap: () {
            if (canSubmit) {
              context.pop(
                DemoData(
                  name: nameController.text.trim(),
                  des: desController.text.trim(),
                  number: int.tryParse(numberController.text.trim()) ?? 0,
                  acceptNumber: 0,
                  time: time,
                ),
              );
            }
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue.withValues(alpha: canSubmit ? 1 : 0.5),
            ),
            child: Center(
              child: Text(
                'ĐĂNG',
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
