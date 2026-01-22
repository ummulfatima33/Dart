import 'bank_account.dart';

class Payment {
  BankAccount? sender;
  BankAccount? receiver;
  double? sendingAmount;

  // Constructor
  Payment(this.sender, this.receiver, this.sendingAmount);

  bool isBalanceSufficient() {
    var sufficient = sender!.balance! >= sendingAmount!;
    return sufficient;
  }

  void transaction() {
    if (isBalanceSufficient()) {
      sender!.balance = sender!.balance! - sendingAmount!;
      print("Transaction Performed Successfully");
    } else {
      print("Sufficient Balance");
    }
  }

  void showPrint() {
    print("========== Payment Info =========");
    print("Sender Name : ${sender!.accountName}");
    print("Sender Acc : ${sender!.accountNumber}");
    print("Current Balance : ${sender!.balance}");
    print("Amount Send : $sendingAmount");
    print("Receiver Name : ${receiver!.accountName}");
    print("Receiver Acc : ${receiver!.accountNumber}");
    print("================================");
  }

  // double remainingBalance() {
  //   return sender!.balance = sender!.balance! - sendingAmount!;
  // }
}
