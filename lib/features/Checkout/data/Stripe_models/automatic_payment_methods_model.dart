class AutomaticPaymentMethods {
  final String allowRedirects;
  final bool enabled;

  AutomaticPaymentMethods({required this.allowRedirects, required this.enabled});

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    return AutomaticPaymentMethods(
      allowRedirects: json['allow_redirects'] ?? '',
      enabled: json['enabled'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'allow_redirects': allowRedirects,
    'enabled': enabled,
  };
}