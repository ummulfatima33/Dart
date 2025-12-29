import 'dart:io';
import 'package:excel/excel.dart';

void main() {

  List<Map<String, String>> patients = [
    {
      "PatientId": "101",
      "PatientName": "Ali",
      "PatientContact": "03215445324",
      "PatientEmail": "ali@gmail.com",
      "PatienBloodGroup": "A+",
    },
    {
      "PatientId": "102",
      "PatientName": "Dua",
      "PatientContact": "03212134565",
      "PatientEmail": "dua@gmail.com",
      "PatienBloodGroup": "O+",
    },
    {
      "PatientId": "103",
      "PatientName": "Akmal",
      "PatientContact": "0322654558",
      "PatientEmail": "akmal@gmail.com",
      "PatienBloodGroup": "B+",
    },
    {
      "PatientId": "104",
      "PatientName": "Faizan",
      "PatientContact": "031265789999",
      "PatientEmail": "faizan@gmail.com",
      "PatienBloodGroup": "AB-",
    },
    {
      "PatientId": "105",
      "PatientName": "Sidra",
      "PatientContact": "0312652229999",
      "PatientEmail": "sidra@gmail.com",
      "PatienBloodGroup": "O-",
    },
  ];

  Excel myexcel = Excel.createExcel();
  var sheet = myexcel["All Patients"];
  myexcel.setDefaultSheet(sheet.sheetName);

  // ================= HEADER STYLE =================
  var headerStyle = CellStyle(
    bold: true,
    backgroundColorHex: ExcelColor.blue,
    fontColorHex: ExcelColor.white,
    horizontalAlign: HorizontalAlign.Center,
  );

  // ================= EVEN / ODD ROW STYLES =================
  var evenRowStyle = CellStyle(
    backgroundColorHex: ExcelColor.grey200,
  );

  var oddRowStyle = CellStyle(
    backgroundColorHex: ExcelColor.white,
  );

  // ================= HEADINGS =================
  var headings = patients.first.keys.toList();
  for (int col = 0; col < headings.length; col++) {
    var headingCell = sheet.cell(
      CellIndex.indexByColumnRow(columnIndex: col, rowIndex: 0),
    );
    headingCell.value = TextCellValue(headings[col]);
    headingCell.cellStyle = headerStyle;
  }

  // ================= RECORDS =================
  for (int row = 0; row < patients.length; row++) {
    int excelRow = row + 1;
    List values = patients[row].values.toList();

    bool isEven = row % 2 == 0;
    var rowStyle = isEven ? evenRowStyle : oddRowStyle;

    for (int col = 0; col < values.length; col++) {
      var contentCell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: col, rowIndex: excelRow),
      );
      contentCell.value = TextCellValue(values[col]);
      contentCell.cellStyle = rowStyle;
    }
  }

  // ================= SAVE FILE =================
  var bytes = myexcel.save();
  File("${Directory.current.path}/HospitalData.csv")
    ..createSync(recursive: true)
    ..writeAsBytesSync(bytes!);

  print("HospitalData.csv created with UX formatting!");
}
