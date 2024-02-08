import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';
import 'package:gp/view/widget/default_more_option_item.dart';
import 'package:sizer/sizer.dart';

class Chat extends StatefulWidget {
  const Chat({super.key, required this.massage, required this.company});
  final String massage;
  final String company;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<String> chat = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chat.add(widget.massage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: ListTile(
          leading: SvgPicture.asset(
            'assets/images/${widget.company}.svg',
          ),
          title: Text(
            widget.company,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppTheme.neutralColors[900],
                fontWeight: AppTheme.mediumWeight),
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/images/more.svg'),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (con) {
                    return SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          MoreOptionItem(
                            icon: 'assets/images/briefcase.svg',
                            text: 'Visit job post',
                            function: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MoreOptionItem(
                            icon: 'assets/images/note.svg',
                            text: 'View my application',
                            function: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MoreOptionItem(
                            icon: 'assets/images/sms.svg',
                            text: 'Mark as unread',
                            function: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MoreOptionItem(
                            icon: 'assets/images/notification.svg',
                            text: 'Mute',
                            function: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MoreOptionItem(
                            icon: 'assets/images/import.svg',
                            text: 'Archive',
                            function: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MoreOptionItem(
                            icon: 'assets/images/trash.svg',
                            text: 'Delete conversation',
                            function: () {},
                          ),
                        ],
                      ),
                    );
                  });
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: chat.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: index == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == 0
                                ? AppTheme.neutralColors[200]
                                : AppTheme.primaryColors[500]),
                        child: Expanded(
                            child: Text(
                          chat[index],
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: index == 0
                                      ? AppTheme.neutralColors[800]
                                      : AppTheme.neutralColors[100]),
                        )),
                      ),
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.neutralColors[200]!),
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: SvgPicture.asset('assets/images/paperclip-2.svg'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 45,
                    width: 60.w,
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        setState(() {
                          chat.add(value);
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Write a message...',
                        hintStyle: Theme.of(context).textTheme.displayMedium,
                        contentPadding:
                            const EdgeInsets.only(bottom: 20, left: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              BorderSide(color: AppTheme.neutralColors[200]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              BorderSide(color: AppTheme.neutralColors[200]!),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.neutralColors[200]!),
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: SvgPicture.asset('assets/images/microphone-2.svg'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            )
          ],
        ),
      ),
    );
  }
}
