import 'package:flutter/material.dart';
import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/destination_card.dart';
import 'package:airplane/ui/widgets/destination_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<DestinationCubit, DestinationState>(
        listener: (context, state) {
          if (state is DestinationFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is DestinationSuccess) {
            return ListView(
              children: [
                titleRow(),
                listRow(state.destinations),
                subTitle(),
                listColumn(state.destinations),
                SizedBox(
                  height: 140,
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget titleRow() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 30,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Howdy,\n${state.user.name}',
                      style: titleTextStyle,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Where to fly today',
                      style: subTitleTextStyle,
                    )
                  ],
                ),
                Spacer(),
                Image.asset(
                  'assets/images/profile.png',
                  width: 60,
                  height: 60,
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget listRow(List<DestinationModel> destinations) {
    return Container(
      height: 323,
      child: ListView(
        padding: EdgeInsets.only(left: 24),
        scrollDirection: Axis.horizontal,
        children: destinations.map((DestinationModel destination) {
          return DestinationCard(destination);
        }).toList(),
      ),
    );
  }

  Widget listColumn(List<DestinationModel> destinations) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: destinations.map((DestinationModel destination) {
          return DestinationTile(destination);
        }).toList(),
      ),
    );
  }

  Widget subTitle() {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 24),
      child: Text(
        'New This Year',
        style: subTextStyle,
      ),
    );
  }
}
