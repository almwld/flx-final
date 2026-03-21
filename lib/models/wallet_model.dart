class WalletModel {
  final String id;
  final String userId;
  final double yerBalance;
  final double sarBalance;
  final double usdBalance;

  WalletModel({
    required this.id,
    required this.userId,
    this.yerBalance = 0.0,
    this.sarBalance = 0.0,
    this.usdBalance = 0.0,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      yerBalance: (json['yer_balance'] ?? 0.0).toDouble(),
      sarBalance: (json['sar_balance'] ?? 0.0).toDouble(),
      usdBalance: (json['usd_balance'] ?? 0.0).toDouble(),
    );
  }
}
