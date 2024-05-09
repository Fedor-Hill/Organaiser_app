part of 'mark.dart';

class CriteriaMark extends Mark {
  const CriteriaMark( 
      {required super.subject,
      required super.value,
      required super.markDate,
      required this.maxValue, 
      required this.section, 
      required this.part,
      required super.mood});

  // Field number mean 
  final int maxValue, section, part;
}
