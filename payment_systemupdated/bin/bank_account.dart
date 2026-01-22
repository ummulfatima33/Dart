class BankAccount {
  //  Properties
  String? accountName;
  String? accountNumber;
  double? balance;
  String? pin;

  BankAccount(this.accountName, this.accountNumber, this.balance, this.pin);

  //  Covert JSON into Dart
  factory BankAccount.fromJson(Map<String, dynamic> rawData) {
    return BankAccount(
      rawData["AccountTitle"],
      rawData["AccountNumber"],
      double.parse(rawData["Balance"].toString()),
      rawData["Pin"],
    );
  }

  //  Covert Dart into JSON
  Map<String, dynamic> toJson() {
    return {
            "AccountTitle" : accountName,
            "AccountNumber" : accountNumber,
            "Balance" : balance,
            "Pin" : pin
    };
  }
}
