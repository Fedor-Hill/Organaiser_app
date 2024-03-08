part of 'my_persons.dart';

class MyPersonsMobileScreen extends StatelessWidget {
  const MyPersonsMobileScreen({super.key, required this.list});

  final List<PersonModel> list;

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
    body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text(appLocal.title_person),
            centerTitle: true,
            pinned: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          
          SliverList.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => PersonTile(personModel: list[index]),
          ),

          SliverToBoxAdapter(
            child: Divider(indent: 20, endIndent: 20, color: theme.colorScheme.primary)
          )
        ],
      ),
    ));
    
  }
}

class PersonTile extends StatelessWidget {
  const PersonTile({super.key, required this.personModel});

  final PersonModel personModel;

  @override
  Widget build(BuildContext context) {
    final String fullName = "${personModel.lastName} ${personModel.firstName} ${personModel.middleName}"; 
    final Icon icon = personModel.sex.compareTo("Female") == 0 
    ? const Icon(Icons.woman_rounded) : const Icon(Icons.man_rounded);

    return SizedBox( width: double.infinity, child: ListTile(
      leading: icon,
      title: Text(fullName),
    ));
  }
}
