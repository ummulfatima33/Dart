import 'package:oop_work/oop_work.dart' as oop_work;
import './payment.dart';

void main() {

Payment pay = Payment(
 "Fatima",
 "ab12hhhk3456666",
 "Iqra",
 "hbagj127689999",
      20000
);
  double remainingBal = pay.sendingBalance! - pay.sendingAmount!;

print("Receiver Name is : ${pay.receiverName}");
print("Sender  Name  is : ${pay.senderName}");
print("Sending Amount is : ${pay.sendingAmount}");
print("Sending Balance is : ${pay.sendingBalance}");
print("Remaining BAlance is : $remainingBal");


}
 
