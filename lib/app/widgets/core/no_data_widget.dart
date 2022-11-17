// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import '/app/theme/ui_helpers.dart';
import '/app/utils/app_texts.dart';

class NoDataWidget extends StatelessWidget {
  final String asset, name, description;
  const NoDataWidget(this.name, this.description, this.asset, {super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 150,
                  child: Image.asset(asset)),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    NoDataHeadingText(name),
                    verticalSpaceSmall,
                    NoDataBodyText(description)
                  ],
                ),
              ),
            ],
          ),
        ],
      ).marginOnly(bottom: 30),
    );
  }
}
