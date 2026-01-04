import 'package:fabonacci_series/fabonacci_series.dart' as fabonacci_series;

void main() {
  int first = 0;
  int second = 1;
  int next = 1;
  int evenCount = 0;
  int oddCount = 0;

  print(next - 1);

  for (int index = 0; index < 100; index++) {
    // print(next);
    if (next % 2 == 0) {
      print("Even number is : $next");
      evenCount++;
    } else {
      print("Odd number is : $next");
      oddCount++;
    }
    next = first + second;
    first = second;
    second = next;
  }
  print("EVEN Count Is : $evenCount");
  print("ODD Count Is : $oddCount");
}
