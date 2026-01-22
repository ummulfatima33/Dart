import 'dart:convert';

import './payment.dart';
import './bank_account.dart';
import 'dart:io';

void main() async {
  File dataFile = File("${Directory.current.path}/data.json");
  String values = await dataFile.readAsString();
  var data = jsonDecode(values);
  List<BankAccount> accounts = (data["Accounts"] as List)
      .map((item) => BankAccount.fromJson(item))
      .toList();

  // List<BankAccount> accounts = [
  //   BankAccount("Khadija", "123456", 50000, "1234"),
  //   BankAccount("Fatima", "112233", 3000, "1122"),
  //   BankAccount("Kulsoom", "223344", 20000, "2233"),
  //   BankAccount("Dua", "334455", 10000, "3344"),
  // ];

  print("===================================");
  print("===================================");
  print("Welcome To The Fatima Bank!");
  print("===================================");
  print("===================================");

  BankAccount? loggedInUser;

  // while User Performing Actions
  while (loggedInUser == null) {
    print("Please Enter Pin");
    var acn = stdin.readLineSync();

    // Loop For Pin Number
    for (var element in accounts) {
      if (acn == element.pin) {
        loggedInUser = element;

        //  Jump Statement
        break;
      }
    }
    if (loggedInUser == null) {
      print("User Doesn't Exist");
      break;
    } else {
      print("Welcome to Bank ${loggedInUser.accountName}");
    }

    // Loop For Menu Section
    while (true) {
      print("-------------------- Main Menu ------------------ \n");
      print("1. Transaction");
      print("2. Balance Inquiry");
      print("3. Logout");
      print("4. Exit");

      var option = stdin.readLineSync();

      if (option == "1") {
        BankAccount? receiver;
        print("Enter receiver Account Number");
        var rca = stdin.readLineSync();

        // Receiver Account Number Match
        for (var item in accounts) {
          if (item.accountNumber == rca) {
            receiver = item;
          }
        }

        print("Enter Amount");
        var amount = double.parse(stdin.readLineSync()!);

        // Instance Of Class Payment To Make Transaction & Show Details
        var pay = Payment(loggedInUser, receiver, amount);

        // To Show The Details Of Payment
        pay.showPrint();

        //  Executing Transaction Of Amount
        pay.transaction();
        print("Your Remaining Balance Is : ${loggedInUser!.balance} ");

        //  Update Json File Balance
        for (var account in accounts) {
          //  Sender Data Update
          if (account.accountNumber == loggedInUser!.accountNumber) {
            account.balance = loggedInUser.balance;
          }
          //  Receiver Data Update
          if (account.accountNumber == receiver!.accountNumber) {
            account.balance = receiver.balance;
          }

          var updatedValue = {
            "Accounts": accounts.map((item) => item.toJson()).toList(),
          };
          var updatedData = jsonEncode(updatedValue);
          await dataFile.writeAsString(updatedData);
        }
      } else if (option == "2") {
        print("============== Balance Inquiry ==============");
        print("Your  Balance Is : ${loggedInUser!.balance} ");
      } else if (option == "3") {
        print("======== Logout Successfully =========");

        // To Start From Scratch
        main();
      } else if (option == "4") {
        print("Thank You  For Using Our Services");
        break;
      }
    }
  }
}
