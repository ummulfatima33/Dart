import 'package:synchronus_asynchronus/synchronus_asynchronus.dart'
    as synchronus_asynchronus;

Future<void> main() async {
  print("Hello");

   bringFood()
      .then(
        (res) => {
          Future.delayed(Duration(seconds: 10)),
          print("Bring Tea for Me"),
        },
      )
      .catchError((err) => {print("Khana Khn Reh gya?")});
  print("I am hungry");

  // print("Bring Tea For Me");
  // print("I'm Waiting For My Tea");
  // await Future.delayed(Duration(seconds: 3));
  // print("My Tea Has Been Received");
}

Future<void> bringFood() async {
  await Future.delayed(Duration(seconds: 5));
  print("Food Is Arived!!");
}

// Async
// Await
