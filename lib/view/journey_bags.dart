import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/bloc/journey_bags_cubit.dart';
import 'package:bonbagage/widget/bag_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JourneyBags extends StatelessWidget {
  const JourneyBags({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JourneyBagsCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: BlocBuilder<JourneyBagsCubit, List<BagsState>>(
              builder: (context, state) {
                return SafeArea(
                  child: ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      final obj = state[index];
                      return BagCardWidget(bag: obj, cubit: context.read<JourneyBagsCubit>());
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
