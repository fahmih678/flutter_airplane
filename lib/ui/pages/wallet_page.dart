import 'package:flutter/material.dart';
import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Center(
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  // boxShadow: BoxShadow.
                  ),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/box_bonus.png',
                    height: 200,
                    width: 300,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: subItemTextStyle.copyWith(
                                    color: whiteColor,
                                  ),
                                ),
                                Text(
                                  state.user.name,
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              height: 24,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/logo_plan.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Pay',
                                    style: itemTextStyle.copyWith(
                                      color: whiteColor,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          'Balance',
                          style: subItemTextStyle.copyWith(
                            color: whiteColor,
                          ),
                        ),
                        Text(
                          'IDR 289.000.000',
                          style: splashTextStyle.copyWith(
                            fontSize: 26,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
