class Risk {
  final String country;
  final int infection_Risk, case_Fatality_Rate;

  Risk(
      {required this.country,
      required this.infection_Risk,
      required this.case_Fatality_Rate});

  factory Risk.fromJson(Map<String, dynamic> json) {
    return Risk(
        country: json['Country'],
        infection_Risk: json['Infection_Risk'],
        case_Fatality_Rate: json['Case_Fatality_Rate']);
  }

  static List<Risk> riskFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Risk.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'country : $country , infection_Risk : $infection_Risk , case_Fatality_Rate : $case_Fatality_Rate';
  }
}
