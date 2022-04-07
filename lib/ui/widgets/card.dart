import 'package:flutt_er/app_styles/app_styles.dart';
import 'package:flutt_er/models/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationCard extends StatelessWidget {
  final NotificationData notificationData;

  NotificationCard({required this.notificationData});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFF615CF7),
              child: SvgPicture.asset(notificationData.iconURL!),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (notificationData.time != null)
                    Text(
                      notificationData.time!.toString(),
                      style: AppStyles().time,
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  if (notificationData.content != null)
                    Text(
                      notificationData.content!,
                      style: AppStyles().contentStyle,
                    ),
                  if (notificationData.notificType == "Status" &&
                          notificationData.updateInfo != null ||
                      notificationData.notificType == "Updates" &&
                          notificationData.updateInfo != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                          width: 160,
                          height: 60,
                          color: Color(0xFFFAFAFC),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                notificationData.updateInfo ?? '',
                                style: AppStyles().updateInfoStyle,
                              ))),
                    ),
                  if (notificationData.notificType == "Updates")
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        "Перейти в карточку места",
                        style: AppStyles().actionStyle,
                      ),
                    )
                  else if (notificationData.notificType == "Status")
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        "Перейти в заказ",
                        style: AppStyles().actionStyle,
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        "Перейти в заказ",
                        style: AppStyles().actionStyle,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ));
  }
}
