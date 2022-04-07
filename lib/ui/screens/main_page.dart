import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutt_er/models/notification.dart';
import 'package:flutt_er/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController tabController;
  bool loading = true;
  List<NotificationData> list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Future.delayed(
        Duration(milliseconds: 250),
        () {
          setState(() {
            list = [
              NotificationData(
                iconURL: "assets/icons/heart-outline.svg",
                time: DateFormat('kk:mm').format(DateTime.now()),
                notificType: "Updates",
                updateInfo: "Макдоналдс",
                content:
                    "У вашего избранного места появилась новая категория блюд",
              ),
              NotificationData(
                  iconURL: "assets/icons/clock-outline.svg",
                  time: DateFormat('kk:mm').format(DateTime.now()),
                  notificType: "Status",
                  content: "Изменился статус заказа №13124",
                  updateInfo: "В работе -> Доставлен"),
              NotificationData(
                  iconURL: "assets/icons/message-text-outline.svg",
                  time: DateFormat('kk:mm').format(DateTime.now()),
                  notificType: "Message",
                  content: "Новое сообщение в заказе №13126",
                  updateInfo: "В работе -> Доставлен"),
              NotificationData(
                  iconURL: "assets/icons/clock-outline.svg",
                  time: DateFormat('kk:mm').format(DateTime.now()),
                  notificType: "Status",
                  content: "Изменился статус заказа №13128",
                  updateInfo: "В работе -> Доставлен"),
              NotificationData(
                  iconURL: "assets/icons/clock-outline.svg",
                  time: DateFormat('kk:mm').format(DateTime.now()),
                  notificType: "Status",
                  content: "Изменился статус заказа №13129",
                  updateInfo: "В работе -> Доставлен"),
              NotificationData(
                iconURL: "assets/icons/heart-outline.svg",
                time: DateFormat('kk:mm').format(DateTime.now()),
                notificType: "Updates",
                updateInfo: "Стейки",
                content:
                    "У вашего избранного места появилась новая категория блюд",
              ),
              NotificationData(
                  iconURL: "assets/icons/clock-outline.svg",
                  time: DateFormat('kk:mm').format(DateTime.now()),
                  notificType: "Status",
                  content: "Изменился статус заказа №13130",
                  updateInfo: "В работе -> Доставлен"),
              NotificationData(
                iconURL: "assets/icons/heart-outline.svg",
                time: DateFormat('kk:mm').format(DateTime.now()),
                notificType: "Updates",
                updateInfo: "КЕФСИ",
                content:
                    "У вашего избранного места появилась новая категория блюд",
              )
            ];
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFAFAFC),
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: SvgPicture.asset('assets/icons/menu.svg',
                      fit: BoxFit.fill),
                ),
                Tab(
                  icon: SvgPicture.asset('assets/icons/map-marker-outline.svg',
                      fit: BoxFit.fill),
                ),
                Tab(
                  icon: SvgPicture.asset('assets/icons/bell-outline.svg',
                      fit: BoxFit.fill),
                ),
              ],
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BubbleTabIndicator(
                indicatorColor: Color(0xFF615CF7),
                indicatorRadius: 60,
                indicatorHeight: 35,
                tabBarIndicatorSize: TabBarIndicatorSize.label,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFFAFAFC),
      body: TabBarView(
        children: [
          Icon(Icons.cabin),
          Icon(Icons.safety_divider),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    color: Colors.white,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Поиск по номеру заказа",
                          hintStyle: TextStyle(color: Color(0xFFE0E0E0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NotificationCard(
                            notificationData: list.elementAt(index));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        controller: tabController,
      ),
    );
  }
}
