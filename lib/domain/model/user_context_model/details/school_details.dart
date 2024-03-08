class SchoolDetails {
  final int id;
  final String name;
  final String type;
  final List groupIds;

  SchoolDetails({
    required this.id, 
    required this.name,
    required this.type,
    required this.groupIds
  });

  factory SchoolDetails.toList(Map<String, dynamic> e) {
    return SchoolDetails(id: e['id'], name: e['name'], type: e['type'], groupIds: e['groupIds']);
  }
}
