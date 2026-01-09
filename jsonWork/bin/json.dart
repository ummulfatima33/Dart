import 'dart:convert';
import 'dart:io';

void main() async {
  var jsonFile = File("data.json");
  // var jsonString = await jsonFile.readAsString(); // print(jsonString);
  // var data = jsonDecode(jsonString); //  print(jsonString[15]);

  // print(data["Students"][2]["StudentName"]);
  // print(data["Students"][2]["StudentSlot"]);




  // Check if file exists
  if (!await jsonFile.exists()) {
    print("File not found!");
    return;
  }

  String jsonString = await jsonFile.readAsString();

  Map<String, dynamic> data = jsonDecode(jsonString);

  // Check Students list
  if (data.containsKey("Students") && data["Students"].length > 3) {
    data["Students"][3]["StudentName"] = "Faizan";
  } else {
    print("Student index does not exist");
    return;
  }

  String stringedJson = jsonEncode(data);
  await jsonFile.writeAsString(stringedJson);

  print("JSON updated successfully");
}

