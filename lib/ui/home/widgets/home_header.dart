import 'package:finance_ai/ui/core/ui/profile_icon.dart';
import 'package:finance_ai/ui/home/widgets/month_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:finance_ai/ui/core/themes/colors.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => HomeHeaderState();
}

class HomeHeaderState extends State<HomeHeader> {
  String selectedMonth = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ProfileIcon(
              imageUrl: "https://github.com/hmartiins.png",
              size: 32,
            ),
            MonthDropdown(
              onChanged: (String month) {
                setState(() {
                  selectedMonth = month;
                });
              },
            ),
            const Icon(
              CupertinoIcons.bell_fill,
              color: AppColors.violet100,
              size: 32,
            ),
          ],
        )
      ],
    );
  }
}
