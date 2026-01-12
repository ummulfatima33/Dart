import 'dart:io';
import 'payment_service.dart';

void main() {
  PaymentService paymentService = PaymentService();

  print("\n=========SECURE PAYMENT SYSTEM========");
  print("1. Transaction");
  print("2. Balance Inquiry");
  stdout.write("Select Option (1 or 2): ");

  String? choice = stdin.readLineSync();

  if (choice == "1") {
    stdout.write("Enter Receiver Name : ");
    String? receiverName = stdin.readLineSync();
    if (receiverName == null) {
      print("Please Required Receiver Name.Transaction Cancelled.");
      return;
    }
    stdout.write("Enter Receiver Account  Number : ");
    String? receiverAccount = stdin.readLineSync();
    if (receiverAccount == null) {
      print("Please Required Receiver Account Number.Transaction Cancelled.");
      return;
    }
    stdout.write("Enter Sending Amount: ");
    String? amountInput = stdin.readLineSync();
    if (amountInput == null) {
      print("Amount is required. Transaction cancelled.");
      return;
    }

    double? amount = double.tryParse(amountInput);
    if (amount == null) {
      print(" Invalid amount. Transaction cancelled.");
      return;
    }
    paymentService.makeTransaction(
      receiverName: receiverName,
      receiverAccount: receiverAccount,
      amount: amount,
    );
  } else if (choice == "2") {
    paymentService.showAccountInfo();
  } else {
    print("Invalid Option Selected");
  }
}
