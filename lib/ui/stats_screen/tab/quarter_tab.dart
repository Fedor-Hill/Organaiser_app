import 'package:flutter/material.dart';
import 'package:organaiser/ui/stats_screen/mark_sliver_list/quarter_mark_sliverlist/quarter_mark_sliverlist.dart';

class QuarterTab extends StatelessWidget {
  const QuarterTab({super.key, required this.rawNumber});

  final int rawNumber;

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);

    // debugPrint(rawNumber.toString());

    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        //--------------------------------------//
        // SliverPadding(
        //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //   sliver: SliverToBoxAdapter(
        //     child: Container(
        //       color: theme.colorScheme.surface,
        //       height: 200,
        //       width: 200,
        //       child: const Center(child: Text("Quarter Statitstic epta"))
        //     )
        //   )
        // ),
        //--------------------------------------//
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          sliver: QuarterMarkSliverList(rawNumber: rawNumber)
        )
      ]
    );
  }
}
