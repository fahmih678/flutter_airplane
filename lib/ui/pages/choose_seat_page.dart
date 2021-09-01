import 'package:flutter/material.dart';
import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/row_seat_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;

  const ChooseSeatPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Text(
          'Select Your\nFavorite Seat',
          style: titleTextStyle,
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            // NOTE: Availlable
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(left: 10, right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/seat_available.png'),
                ),
              ),
            ),
            Text(
              'Available',
              style: keyTextStyle,
            ),
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(left: 10, right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/seat_picked.png'),
                ),
              ),
            ),
            Text(
              'Selected',
              style: keyTextStyle,
            ),
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(left: 10, right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/seat_unavailable.png'),
                ),
              ),
            ),
            Text(
              'Unavailable',
              style: keyTextStyle,
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
// NOTE : Body
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                // NOTE: Seat Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'A',
                          style: subTitleTextStyle.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'B',
                          style: subTitleTextStyle.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          '',
                          style: subTitleTextStyle,
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'C',
                          style: subTitleTextStyle.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'D',
                          style: subTitleTextStyle.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // NOTE: Row Seat
                Column(
                  children: [
                    RowSeatItem(
                      status1: true,
                      status2: false,
                      status3: true,
                      status4: false,
                      number: 1,
                      id1: 'A1',
                      id2: 'B1',
                      id3: 'C1',
                      id4: 'D1',
                    ),
                    RowSeatItem(
                      status1: true,
                      status2: false,
                      status3: true,
                      status4: false,
                      number: 2,
                      id1: 'A2',
                      id2: 'B2',
                      id3: 'C2',
                      id4: 'D1',
                    ),
                    RowSeatItem(
                      status1: true,
                      status2: false,
                      status3: true,
                      status4: false,
                      number: 3,
                      id1: 'A3',
                      id2: 'B3',
                      id3: 'C3',
                      id4: 'D3',
                    ),
                    RowSeatItem(
                      status1: true,
                      status2: false,
                      status3: true,
                      status4: false,
                      number: 4,
                      id1: 'A4',
                      id2: 'B4',
                      id3: 'C4',
                      id4: 'D4',
                    ),
                    RowSeatItem(
                      status1: true,
                      status2: false,
                      status3: true,
                      status4: false,
                      number: 5,
                      id1: 'A5',
                      id2: 'B5',
                      id3: 'C5',
                      id4: 'D5',
                    ),
                  ],
                ),

                // NOTE: Yout seat detail cost
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Your seat',
                              style: subTitleTextStyle,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                state.join(', '),
                                style: subTextStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: subTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'IDR ',
                              decimalDigits: 0,
                            ).format(state.length * destination.price),
                            style: subTextStyle.copyWith(
                              color: purpleColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    }

// NOTE: Btn Continue to Checkout
    Widget btn() {
      return Column(
        children: [
          SizedBox(
            height: 30,
          ),
          BlocBuilder<SeatCubit, List<String>>(
            builder: (context, state) {
              return CustomBtn(
                title: 'Continue to Checkout',
                onPressed: () {
                  int price = destination.price * state.length;
                  double vat = 0.5;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutPage(
                        TransactionModel(
                          destination: destination,
                          amountOfTraveler: state.length,
                          selectedSeats: state.join(', '),
                          insurance: true,
                          refundable: false,
                          price: price,
                          vat: vat,
                          grandTotal: price + (price * vat).toInt(),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          SizedBox(
            height: 46,
          ),
        ],
      );
    }

// NOTE: Display
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          btn(),
        ],
      ),
    );
  }
}
