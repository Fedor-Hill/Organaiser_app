class ChildrenDetails {
  final int personId;
  final String firstName;
  final String lastName;
  final String middleName;
  final String shortName;
  final List schoolIds;
  final List groupIds;


  ChildrenDetails({
    required this.personId,
    required this.firstName, 
    required this.lastName,
    required this.middleName,
    required this.shortName,
    required this.schoolIds,
    required this.groupIds
  });

  factory ChildrenDetails.toList(Map<String, dynamic> e) {
    return ChildrenDetails(
        personId: e['personId'], 
        firstName: e['firstName'], 
        lastName: e['lastName'], 
        middleName: e['middleName'], 
        shortName: e['shortName'], 
        schoolIds: e['schoolIds'], 
        groupIds: e['groupIds']
        );
  }
}
