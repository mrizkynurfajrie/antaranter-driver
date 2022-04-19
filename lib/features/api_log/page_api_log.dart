import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/api_log/components/card_status.dart';
import 'package:antaranter_driverapp/features/api_log/components/text_copy.dart';
import 'package:antaranter_driverapp/features/api_log/controller_api_log.dart';
import 'package:antaranter_driverapp/shared/helpers/format_date_time.dart';

class PageApiLog extends GetView<ControllerApiLog> {
  const PageApiLog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
        title: 'API LOGS',
        padding: EdgeInsets.all(Insets.xs),
        center: null,
        child: Obx(
          () => ListView(
            children: [
              ExpansionPanelList(
                elevation: 0,
                expandedHeaderPadding: EdgeInsets.zero,
                children: controller.apiLogs
                    .asMap()
                    .map((i, e) => MapEntry(
                        i,
                        ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder: (context, isExpanded) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Insets.sm,
                                      vertical: Insets.lg),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CardStatus(status: e.method),
                                          horizontalSpace(Insets.sm),
                                          CardStatus(
                                            status: FormatDateTime.formatDate(
                                                value: e.timestamp),
                                          ),
                                          horizontalSpace(Insets.sm),
                                          e.error.isEmpty
                                              ? Icon(
                                                  Icons.check_circle_outline,
                                                  color: AppColor.successColor,
                                                  size: IconSizes.sm,
                                                )
                                              : Icon(
                                                  Icons.error_outline_outlined,
                                                  color: Colors.red,
                                                  size: IconSizes.sm,
                                                ),
                                        ],
                                      ),
                                      verticalSpace(Insets.xs),
                                      TextCopy(
                                        text: e.url,
                                        style: TextStyles.callout2
                                            .copyWith(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                            body: Column(
                              children: [
                                e.payload != 'null'
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Divider(),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                vertical: Insets.xs,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Insets.sm,
                                                  vertical: Insets.xs),
                                              decoration: BoxDecoration(
                                                borderRadius: Corners.smBorder,
                                                color: Colors.indigo
                                                    .withOpacity(.3),
                                              ),
                                              child: Text(
                                                'PAYLOAD',
                                                style: TextStyles.callout3
                                                    .copyWith(
                                                  color: Colors.indigo.shade700,
                                                ),
                                              ),
                                            ),
                                            TextCopy(
                                              text: e.payload,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : const SizedBox(),
                                e.response.isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Divider(),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                vertical: Insets.xs,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Insets.sm,
                                                  vertical: Insets.xs),
                                              decoration: BoxDecoration(
                                                borderRadius: Corners.smBorder,
                                                color: Colors.green
                                                    .withOpacity(.3),
                                              ),
                                              child: Text(
                                                'RESPONSE',
                                                style: TextStyles.callout3
                                                    .copyWith(
                                                  color: Colors.green.shade700,
                                                ),
                                              ),
                                            ),
                                            TextCopy(
                                              text: e.response,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : const SizedBox(),
                                e.error.isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Divider(),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                vertical: Insets.xs,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Insets.sm,
                                                  vertical: Insets.xs),
                                              decoration: BoxDecoration(
                                                borderRadius: Corners.smBorder,
                                                color:
                                                    Colors.red.withOpacity(.3),
                                              ),
                                              child: Text(
                                                'ERROR',
                                                style: TextStyles.callout3
                                                    .copyWith(
                                                  color: Colors.red.shade700,
                                                ),
                                              ),
                                            ),
                                            TextCopy(
                                              text: e.error,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                            isExpanded: controller.isOpen[i])))
                    .values
                    .toList(),
                expansionCallback: (i, isOpen) {
                  controller.isOpen[i] = !isOpen;
                },
              )
            ],
          ),
        ));
  }
}
