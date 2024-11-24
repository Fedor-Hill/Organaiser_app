import 'package:flutter/material.dart';

class MyDoneFacts extends StatefulWidget {
  const MyDoneFacts({super.key});

  @override
  State<MyDoneFacts> createState() => _MyDoneFactsState();
}

class _MyDoneFactsState extends State<MyDoneFacts> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      vsync: this 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 9,
          child: PageView(
            onPageChanged: (int index) {
              setState(() {
                tabController.index = index;
              });
            },
            children: const [
              CardFact(
                icon: Icon(Icons.handyman_rounded, size: 64),
                title: "Преимущества",
                subTitle: "Легко, быстро и удобно",
              ),
              CardFact(
                icon: Icon(Icons.security_rounded, size: 64),
                title: "Защита",
                subTitle: "Все данные под щитом",
              ),
              CardFact(
                icon: Icon(Icons.done_rounded, size: 64),
                title: "Завершен",
                subTitle: "Можно пользоватся ежедневно",
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        Flexible(
          flex: 1,
          child: TabPageSelector(
            controller: tabController,
            selectedColor: Theme.of(context).colorScheme.primary,
            color: Theme.of(context).iconTheme.color,
          ),
        )
      ],
    );
  }
}

class CardFact extends StatelessWidget {
  const CardFact(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle});

  final Icon icon;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Card(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 70,
            color: theme.colorScheme.primary,
            // padding: const EdgeInsets.all(4),
            child: IconTheme(
              data: theme.iconTheme.copyWith(
                color: theme.colorScheme.onBackground
             ),
              child: icon
            )
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: theme.textTheme.titleLarge!
                .copyWith(color: theme.colorScheme.primary),
            textAlign: TextAlign.center,
          ),
          // const SizedBox(height: 5),
          Text(
            subTitle, 
            style: theme.textTheme.titleSmall,
            textAlign: TextAlign.center
          ),
        ],
      ),
    );
  }
}
