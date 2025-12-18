void main(){
String username = "fatima";
int userage = 19;
String useremail = "fatima123@gmail.com";

int english = 90;
int urdu = 40;
int science = 60;
int computer = 75;

int totalMarks = 400;
int obtainMarks = english + urdu + science + computer;
double percentage = (obtainMarks / totalMarks) * 100;

  print("Introduction TO DART.....");
  print("UserName is: $username");
  print("UserAge is: $userage");
  print("UserEmail is: $useremail");

  print("===============Student Marks====================");
  print("English marks: $english");
  print("Urdu marks: $urdu");
  print("Science marks: $science");
  print("Computer marks: $computer");

  print("===============Result====================");
  print("Student Total Marks: $totalMarks");
  print("Student Obtained Marks: $obtainMarks");
  print("Student Percentage : $percentage % ");

}