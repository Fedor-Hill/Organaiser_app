class EduGroup {
  EduGroup(
      {required this.id,
      required this.parallel,
      required this.name,
      required this.isActive});

  final int id, parallel;
  final String name;
  final bool isActive;
}

class EduGroupData {
  EduGroupData({required List<EduGroup> userEduGroups}) : _userEduGroups = userEduGroups; 

  final List<EduGroup> _userEduGroups;

  List<EduGroup> get userEduGroups => _userEduGroups;
}
