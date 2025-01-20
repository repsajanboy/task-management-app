import 'package:task_management_app/data/models/appointment/appointment_model.dart';
import 'package:task_management_app/networking/api/firebase_firestore_api.dart';

class AppointmentRepository {
  final _firebaseFirestoreApi = FirebaseFirestoreApi();

  Future<void> createAppointment(AppointmentModel appointment) async {
    await _firebaseFirestoreApi.createAppointment(appointment);
  }

  Future<List<AppointmentModel>> getAppointments() async {
    final data = await _firebaseFirestoreApi.getAppointments() as List;
    return data.map((e) {
      return AppointmentModel.fromJson(e.id, e.data());
    }).toList();
  }
}