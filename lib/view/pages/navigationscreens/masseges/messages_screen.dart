import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gp/core/uitlites/app_theme_class.dart';

import 'package:gp/view/pages/navigationscreens/masseges/chat.dart';
import 'package:gp/view/widget/default_more_option_item.dart';

import 'package:gp/view/widget/search_filed.dart';
import 'package:sizer/sizer.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Messsages',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            children: [
              Searchfiled(
                  onTap: () {},
                  readOnly: true,
                  height: 50,
                  width: 75.w,
                  controller: controller,
                  hintText: 'Search messages....',
                  onSubmitted: (value) {}),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (con) {
                        return SizedBox(
                          width: double.infinity,
                          height: 40.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.w, vertical: 3.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Message filters',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                MoreOptionItem(
                                  text: 'Unread',
                                  function: () {},
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                MoreOptionItem(
                                  text: 'Spam',
                                  function: () {},
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                MoreOptionItem(
                                  text: 'Archived',
                                  function: () {},
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppTheme.neutralColors[300]!),
                  ),
                  child: SvgPicture.asset('assets/images/Filter.svg'),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: company.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chat(
                        massage: companyLastMass[index],
                        company: company[index],
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/${company[index]}.svg',
                  ),
                  title: Text(
                    company[index],
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: AppTheme.neutralColors[900],
                        fontWeight: AppTheme.mediumWeight),
                  ),
                  subtitle: Text(
                    companyLastMass[index],
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  trailing: Text(timeOfLastMassage[index]),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: AppTheme.neutralColors[200],
                indent: 10.w,
                endIndent: 5.w,
              );
            },
          ),
        )
      ]),
    );
  }
}

List<String> company = [
  'Twitter',
  'Gojek Indonesia',
  'Shoope',
  'Dana',
  'Slack',
];
List<String> companyLastMass = [
  'Here is the link: http://zoom.com/abcdeefg',
  'Let’s keep in touch.' 'Twitter',
  'Thank You David!',
  'Thank you for your attention!',
  'You: I look forward to hearing from you',
];
List<String> timeOfLastMassage = [
  '12.39',
  '12.39',
  '09.45',
  'Yesterday',
  '12/8',
];
