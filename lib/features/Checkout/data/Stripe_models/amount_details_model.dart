class AmountDetails {
  final Map<String, dynamic> tip;

  AmountDetails({required this.tip});

  factory AmountDetails.fromJson(Map<String, dynamic> json) {
    return AmountDetails(tip: Map<String, dynamic>.from(json['tip']));
  }

  Map<String, dynamic> toJson() => {'tip': tip};
}