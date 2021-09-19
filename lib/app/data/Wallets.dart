// ignore: file_names

class Wallet {
  List<AllWallets>? allWallets;

  Wallet({required this.allWallets});

  Wallet.fromJson(Map<String, dynamic> json) {
    if (json['all_wallets'] != null) {
      allWallets = <AllWallets>[];
      json['all_wallets'].forEach((v) {
        allWallets!.add(AllWallets.fromJson(v));
      });
    }
  }
}

class AllWallets {
  String? title;
  double? amount;
  String? currency;
  String? buttonText;

  AllWallets({required this.title, required this.amount, required this.currency, this.buttonText});

  AllWallets.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    amount = json['amount'];
    currency = json['currency'];
    buttonText = json['buttonText'];
  }
}