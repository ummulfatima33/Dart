class Payment {
  String? receiverName;
  String? receiverAccNo;
  String? senderName;
  String? sendererAccNo;
  double? sendingAmount;
  double? sendingBalance = 50000;

  // Constructor
  
Payment(String rname, String rac, String sname, String sac, double samount){

    receiverName = rname;
    receiverAccNo = rac;
    senderName = sname;
    sendererAccNo = sac;
    sendingAmount = samount;
   
}

}

