import 'package:flutter/material.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/home_page.dart';
import 'package:airplane/ui/pages/setting_page.dart';
import 'package:airplane/ui/pages/transaction_page.dart';
import 'package:airplane/ui/pages/wallet_page.dart';
import 'package:airplane/ui/widgets/custom_button_nav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildReturn(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget navBtn() {
      return Container(
        padding: EdgeInsets.only(top: 18, left: 26, right: 26),
        height: 60,
        width: 327,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: whiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBtnNav(
              index: 0,
              imageUrl: 'assets/images/btn_globe.png',
            ),
            CustomBtnNav(
              index: 1,
              imageUrl: 'assets/images/btn_book.png',
            ),
            CustomBtnNav(
              index: 2,
              imageUrl: 'assets/images/btn_card.png',
            ),
            CustomBtnNav(
              index: 3,
              imageUrl: 'assets/images/btn_setting.png',
            ),
          ],
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          floatingActionButton: navBtn(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          backgroundColor: bgColor,
          body: buildReturn(currentIndex),
        );
      },
    );
  }
}
