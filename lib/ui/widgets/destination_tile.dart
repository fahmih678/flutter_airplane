import 'package:flutter/material.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/detail_page.dart';

class DestinationTile extends StatelessWidget {
  final DestinationModel destination;

  const DestinationTile(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(destination),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                destination.imageUrl,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.name,
                  style: itemTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  destination.city,
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
                SizedBox(
                  width: 3,
                ),
                Text(
                  destination.rating.toString(),
                  style: valueTextStyle,
                ),
              ],
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
