import 'package:flutter/material.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/seat_item.dart';

class RowSeatItem extends StatelessWidget {
  final bool status1;
  final bool status2;
  final int number;
  final bool status3;
  final bool status4;
  final String id1;
  final String id2;
  final String id3;
  final String id4;
  const RowSeatItem({
    Key? key,
    required this.status1,
    required this.status2,
    required this.status3,
    required this.status4,
    required this.number,
    required this.id1,
    required this.id2,
    required this.id3,
    required this.id4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SeatItem(
              isAvailable: status1,
              id: id1,
            ),
            SeatItem(
              isAvailable: status2,
              id: id2,
            ),
            Container(
              height: 48,
              width: 48,
              child: Center(
                child: Text(
                  number.toString(),
                  style: subTitleTextStyle.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SeatItem(
              isAvailable: status3,
              id: id3,
            ),
            SeatItem(
              isAvailable: status4,
              id: id4,
            ),
          ],
        ),
      ],
    );
  }
}
