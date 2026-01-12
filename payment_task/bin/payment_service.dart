import 'dart:io';

class PaymentService {
  String senderAccount = "121163";
  String senderName = "Fatima Attari";

  late double _balance;
  final String balanceFile = "balance.txt";

  PaymentService() {
    _loadBalance();
  }

      // ****Load balance from file****
  void _loadBalance() {
    File file = File(balanceFile);

    if (file.existsSync()) {
      _balance = double.parse(file.readAsStringSync());
    } else {
      _balance = 50000;
      file.writeAsString(_balance.toString());
    }
  }
       // ****Save balance to file****
  void _saveBalance() {
    File(balanceFile).writeAsStringSync(_balance.toString());
  }

  // Balance Inquiry
  void showAccountInfo() {
    print("\n==============ACCOUNT INFORMATION===============");
    print("Account Holder    : $senderName");
    print("Account Number    : $senderAccount");
    print("Available Balance : Rs. $_balance");
    print("================================");
  }

  // Transaction
  void makeTransaction({
    required String receiverName,
    required String receiverAccount,
    required double amount,
  }) {
    if (receiverName.isEmpty ||
        receiverAccount.isEmpty ||
        amount <= 0 ||
        amount > _balance) {
      print("Transaction Validation Failed");
      return;
    }
    _balance -= amount;
    _saveBalance();

    print("\n=========PAYMENT SLIP========");
    print("Sender Name          : $senderName");
    print("Sender Account       : $senderAccount");
    print("--------------------------------");
    print("Receiver Name        : $receiverName");
    print("Receiver Account     : $receiverAccount");
    print("----------------------------");
    print("Amount Sent          : Rs.$amount");
    print("Remaining Balance    : Rs.$_balance");
    print("Status               : Successful!");
    print("==================================");
  }
}
