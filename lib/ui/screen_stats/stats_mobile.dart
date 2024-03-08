part of 'stats.dart';

class StatsMobileScreen extends StatelessWidget {
  const StatsMobileScreen({super.key, required this.func});

  final Function func;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My stats"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => func(),
          child: const Text("Press me"),
        ),
      ),
    );
  }

}
