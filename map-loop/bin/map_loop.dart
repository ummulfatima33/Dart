import 'package:map-loop/map-loopn.dart' as map-loop;

void main() {

  Map ali = {
    "PatientId":"101",
    "PatientName":"Ali",
    "PatientContact":"03215445324",
    "PatientEmail":"ali@gmail.com",
    "PatienBloodGroup":"A+",
  };

  Map dua = {
     "PatientId":"102",
    "PatientName":"Dua",
    "PatientContact":"03212134565",
    "PatientEmail":"dua@gmail.com",
    "PatienBloodGroup":"O+",
  };

  Map akmal = {
     "PatientId":"103",
    "PatientName":"Akmal",
    "PatientContact":"0322654558",
    "PatientEmail":"akmal@gmail.com",
    "PatienBloodGroup":"B+",
  };

  Map faizan = {
     "PatientId":"104",
    "PatientName":"Faizan",
    "PatientContact":"031265789999",
    "PatientEmail":"faizan@gmail.com",
    "PatienBloodGroup":"AB-",
  };

  List patients = [ali, dua, akmal, faizan];
  for (var patient in patients) {
    print(patient["PatientName"]);
  } 
}
