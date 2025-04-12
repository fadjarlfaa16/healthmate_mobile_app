import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './doctor_list.dart';
import './doctor_detail.dart';
import '../../models/doctor.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  Widget? _childPage;

  @override
  void initState() {
    super.initState();
    _childPage = _defaultPage();
  }

  Widget _defaultPage() {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return const Center(child: Text("User not logged in"));
    }

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('appointments')
          .where('userId', isEqualTo: userId)
          // .orderBy('date', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_month, size: 80, color: Colors.pink),
                const SizedBox(height: 16),
                const Text(
                  "Your Appointments",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "You don't have an appointment yet",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add Appointment'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  onPressed: _goToDoctorList,
                ),
              ],
            ),
          );
        }

        final appointments = snapshot.data!.docs;

        return ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            final data = appointments[index].data() as Map<String, dynamic>;

            final doctorName = data['doctorName'] ?? 'Unknown';
            final specialist = data['specialist'] ?? '';
            final profile = data['profile'];
            final based = data['based'] ?? '-';
            final date = data['date'] ?? '-';
            final time = data['time'] ?? '-';

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              elevation: 2,
              child: ListTile(
                leading: profile != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(profile),
                        radius: 25,
                      )
                    : const CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.person,
                            color: Color.fromARGB(255, 104, 180, 243)),
                      ),
                title: Text(doctorName,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (specialist.isNotEmpty)
                      Text(specialist,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 148, 216, 247))),
                    Text('$date at $time'),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on, color: Colors.pink),
                    Text(
                      based,
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _goToDoctorList() {
    setState(() {
      _childPage = DoctorListPage(onDoctorSelected: (doctor) {
        setState(() {
          _childPage = DoctorDetailPage(
            doctor: doctor,
            onAppointmentBooked: () {
              setState(() => _childPage = _defaultPage());
            },
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _childPage,
      ),
      floatingActionButton: _childPage.runtimeType != DoctorListPage &&
              _childPage.runtimeType != DoctorDetailPage
          ? Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: FloatingActionButton(
                    backgroundColor: Colors.pink,
                    onPressed: _goToDoctorList,
                    child: const Icon(Icons.add, size: 24),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
