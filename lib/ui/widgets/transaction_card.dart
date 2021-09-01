import 'package:flutter/material.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/detail_item.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(
    this.transaction, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      // height: 170,
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 30,
        bottom: 14,
      ),
      width: 327,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      transaction.destination.imageUrl,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 130,
                    child: Text(
                      transaction.destination.name,
                      style: itemTextStyle,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    transaction.destination.city,
                    style: subItemTextStyle,
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: orangeColor,
                  ),
                  Text(
                    transaction.destination.rating.toString(),
                    style: valueTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20,
              bottom: 10,
            ),
            child: Text(
              'Booking Details',
              style: subTextStyle,
            ),
          ),
          DetailItem(
            title: 'Traveler',
            valueText: '${transaction.amountOfTraveler} person',
            valueColor: blackColor,
          ),
          DetailItem(
            title: 'Seat',
            valueText: transaction.selectedSeats,
            valueColor: blackColor,
          ),
          DetailItem(
            title: 'Insurance',
            valueText: transaction.insurance ? 'Yes' : 'No',
            valueColor: transaction.insurance ? greenColor : pinkColor,
          ),
          DetailItem(
              title: 'Refundable',
              valueText: transaction.refundable ? 'Yes' : 'No',
              valueColor: transaction.refundable ? greenColor : pinkColor),
          DetailItem(
            title: 'VAT',
            valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
            valueColor: blackColor,
          ),
          DetailItem(
            title: 'Price',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(
              transaction.price,
            ),
            valueColor: blackColor,
          ),
          DetailItem(
            title: 'Grand Total',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(
              transaction.grandTotal,
            ),
            valueColor: purpleColor,
          ),
        ],
      ),
    );
  }
}
