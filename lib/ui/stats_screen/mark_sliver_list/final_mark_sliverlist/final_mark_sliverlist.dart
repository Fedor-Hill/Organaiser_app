import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/model/mark/final_mark.dart';
import 'package:organaiser/theme/default_theme.dart';

class FinalMarkSliverList extends StatelessWidget {
  const FinalMarkSliverList({super.key});

  Color getMarkColor(MarkColor markColor, String mood) {
    switch (mood) {
      case "Good":
        return markColor.good;
      case "Average":
        return markColor.average;
      default:
        return markColor.bad;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Year> data = GetIt.I<FinalMarkData>().yearFinalMark;
    final ThemeData theme = Theme.of(context);
    final MarkColor markColor = theme.extension<MarkColor>()!;

    bool isHaveMark = false; 

    for (var epta in data) {
      if (epta.marks.isNotEmpty) {
        isHaveMark = true;
        break;
      }
    }

    if (data.isEmpty || isHaveMark == false) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            "Пока нет оценок",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return SliverList.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        if (data[index].marks.isEmpty) {
          return const SizedBox();
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            title: Text(
              data[index].subjectName,
              style: theme.textTheme.titleLarge
              ),
            trailing: CircleAvatar(
              backgroundColor: getMarkColor(markColor, data[index].marks.first.mood),
              child: Text(
                data[index].marks.first.value.toString(),
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.onBackground
                ),
              )
            )
          )
        );
      }
    );
  }
}
