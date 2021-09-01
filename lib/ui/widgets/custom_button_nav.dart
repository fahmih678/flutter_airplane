import 'package:flutter/material.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBtnNav extends StatelessWidget {
  final int index;
  final String imageUrl;
  const CustomBtnNav({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Container(
        width: 30,
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              color: context.read<PageCubit>().state == index
                  ? purpleColor
                  : greyColor,
              height: 24,
              width: 24,
            ),
            Spacer(),
            context.read<PageCubit>().state == index
                ? Container(
                    height: 2,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                      color: purpleColor,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
