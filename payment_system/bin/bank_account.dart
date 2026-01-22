class BankAccount {
  //  Properties
  String? accountName;
  String? accountNumber;
  double? balance;
  String? pin;

  BankAccount(this.accountName, this.accountNumber, this.balance, this.pin);

  factory BankAccount.fromJson(Map<String, dynamic> rawData) {
    return BankAccount(
      rawData["AccountTitle"],
      rawData["AccountNumber"],
      rawData["Balance"],
      rawData["Pin"],
    );
  }
}
