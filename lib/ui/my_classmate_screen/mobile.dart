part of 'my_classmate_screen.dart';

class MyClassmateMobileScreen extends StatelessWidget {
  const MyClassmateMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final List<Person> data = GetIt.I<PersonData>().persons;

    return Scaffold( 
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text(appLocal.my_class),
            centerTitle: true,
            titleTextStyle: theme.textTheme.titleMedium,
            automaticallyImplyLeading: true,
          ),

          SliverList.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                title: Text(data[index].getFullName()),
                titleTextStyle: theme.textTheme.titleLarge,
                leading: data[index].sex.compareTo("Female") == 0 
                  ? Icon(Icons.woman_rounded, color: theme.colorScheme.primary) 
                  : Icon(Icons.man_rounded, color: theme.colorScheme.secondary)
              )
            )
          )
        ],
      )
    );
  }
}
