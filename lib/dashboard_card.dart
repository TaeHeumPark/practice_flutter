import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String cardTitle;
  final String cardContext;
  final IconData cardIcon;
  final Color? cardIconColor;
  final Color? cardTitleColor;
  final Color? cardContentColor;
  final Color? cardBackgroundColor;
  final String? cardImageAsset;
  Function()? customOnTap;

  DashboardCard(
      {super.key,
      required this.cardTitle,
      required this.cardContext,
      required this.cardIcon,
      this.cardIconColor,
      this.cardTitleColor,
      this.cardContentColor,
      this.cardBackgroundColor,
      this.cardImageAsset,
      this.customOnTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        if(customOnTap == null) {
          return;
        }
        customOnTap!();
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cardBackgroundColor ?? Colors.grey.shade100),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  cardIcon,
                  size: theme.textTheme.headlineSmall?.fontSize,
                  color: cardIconColor ?? Colors.orange,
                ),
              ),
              Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    cardTitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: cardTitleColor ?? Colors.black),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              )
            ],
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Align(
                alignment: Alignment.center,
                child: Text(
                  cardContext,
                  style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cardContentColor ?? Colors.black),
                ),
              )),
              (cardImageAsset != null)
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0), // 텍스트와 이미지 사이의 간격 추가
                        child: Image.asset(
                          cardImageAsset!,
                          width: 50, // 이미지 크기 제한
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : SizedBox.shrink()
            ],
          ))
        ]),
      ),
    );
  }
}
