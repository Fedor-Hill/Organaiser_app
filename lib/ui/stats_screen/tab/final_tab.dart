import 'package:flutter/material.dart';
import 'package:organaiser/ui/stats_screen/mark_sliver_list/final_mark_sliverlist/final_mark_sliverlist.dart';

class FinalTab extends StatelessWidget {
  const FinalTab({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);

    return const CustomScrollView(
      physics: ClampingScrollPhysics(),
      slivers: [
        //--------------------------------------//
        // SliverPadding(
        //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //   sliver: SliverToBoxAdapter(
        //     child: Container(
        //       color: theme.colorScheme.surface,
        //       height: 200,
        //       width: 200,
        //       child: const Center(child: Text("Final Statitstic epta"))
        //     )
        //   )
        // ),
        //--------------------------------------//
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          sliver: FinalMarkSliverList()
        )
      ]
    );
  }
}
