// CREATE CLASS

class Payment {
  String? receiverName;
  String? receiverAccNo;
  String? senderName;
  String? senderAccNo;
  double? sendingAmount;
  double? senderBalance = 63000;
  double? remainingBalance;

  // CREATE CONSTRUCTOR
  Payment(
    this.receiverName,
    this.receiverAccNo,
    this.senderName,
    this.senderAccNo,
    this.sendingAmount
   );


  bool isBalanceSuffcient() {
    var sufficientAmount = senderBalance! >= sendingAmount!;
    return sufficientAmount;
  }

  void transaction() {
    if (isBalanceSuffcient()) {
      remainingBalance = senderBalance! - sendingAmount!;
      showPrint();
    } else {
      print("Your Balancee Is Insufficient");
    }
  }

  void showPrint() {
    print("=================================");
    print("The Sender Name Is : $senderName");
    print("The Sender A/C Is : $senderAccNo");
    print("Current Balance : $senderBalance");
    print("Amount Send : $sendingAmount");
    print("The Receiver Name Is : $receiverName");
    print("The Receiver A/C Is: $receiverAccNo");
    print("Remaining Balance : $remainingBalance");
    print("====================================");
  }
}
