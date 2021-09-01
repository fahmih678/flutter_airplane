import 'package:flutter/material.dart';
import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  // NOTE 0. Available 1. Selected 2. Unavailable
  final String id;
  final bool isAvailable;

  const SeatItem({
    Key? key,
    this.isAvailable = true,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return greyLight;
      } else {
        if (isSelected) {
          return purpleColor;
        } else {
          return purpleLightColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return greyLight;
      } else {
        if (isSelected) {
          return purpleColor;
        } else {
          return purpleColor;
        }
      }
    }

    child() {
      if (!isAvailable) {
        return SizedBox();
      } else {
        if (isSelected) {
          return Center(
            child: Text(
              'YOU',
              style: valueTextStyle.copyWith(
                color: whiteColor,
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor(),
            width: 2,
          ),
        ),
        child: Center(
          child: child(),
        ),
      ),
    );
  }
}
